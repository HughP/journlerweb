// global application singleton
jweb = {
    // properties
    selected_folder: null,
    selected_entry: null,


    // ------------------------------------------------------------------------
    // init functions
    // ------------------------------------------------------------------------
    
    // init: setup the app and GUI
    init: function() {
        jweb.init_activity_indicator();
        jweb.init_splitter_panes();
        jweb.init_folder_tree();
    },


    // init ajax activity indicator 
    init_activity_indicator: function() {
        $().ajaxStart(function() {
            $("#activity_indicator").show();
        }).ajaxStop(function() {
             $("#activity_indicator").hide();
        });
    },

    
    // init splitter panes
    init_splitter_panes: function() {
        $("#rootpane").splitter({
            type: 'v',
            initA: 150
        });
       
 
        $("#entrypane").splitter({
            type: 'h',
            initA: 150
        });

        $(".vsplitbar").add(".hsplitbar").hover(
            function() { $(this).addClass("splitbar_hover"); }, 
            function() { $(this).removeClass("splitbar_hover"); }
        ); 
        
        // splitter panes should resize upon window resize
        $(window).bind("resize", function() {
            $("#rootpane").css("height", ($(window).height() - $("#rootpane").offset().top - 50)+"px");
            if (!jQuery.browser.msie) {
                $("#rootpane").trigger("resize");
            }
        }).trigger("resize");
    },
        
    
    // init folder tree
    init_folder_tree: function() {
        $($("#folderpane").children()[0]).Treeview();
        
        // click on folder --> trigger folder_selected event
        $(".folder").click(function(event) {
            jweb.select_folder(event.target);
            event.stopPropagation(); // otherwise, event will propagate up to parent folder.
        });

        // select folder: as set in cookie or the default one
        jweb.select_folder($.cookie("jweb_selected_folder") || jweb.folder(0));
    },

    
    // init entries table
    init_entries_table: function() {
        $.log("init_entries_table");
        // click on event --> load its content
        $(".entry td").click(function(event) {
            // event happens on TD but the entry is the entire TR
            jweb.select_entry(event.target.parentNode);
        });
        
        $("#entrycontent").empty();
    },


    // ------------------------------------------------------------------------
    // modal window related functions
    // ------------------------------------------------------------------------

    // alert: show modal dialog box
    alert: function(msg) {
        $("#alert").empty().append(msg).fadeOut(5000);
    },
  
    // ------------------------------------------------------------------------
    // folder and entry related functions
    // ------------------------------------------------------------------------
     
    folder: function(id) {
        return $(".folder#" + id + ">span");
    },

    entry: function(id) {
        return $(".entry#" + id);
    },

    // select a folder in the folder tree
    select_folder: function(folder, callback) {
        $.log("selecting folder: " + folder);
        // toggle selection highlight
        if (jweb.selected_folder)
            $(jweb.selected_folder).removeClass("selected_folder");   
        jweb.selected_folder = folder;
        $(jweb.selected_folder).addClass("selected_folder");

        // load entries table
        $("#entries").load("/entries?folder=" + $(folder).attr('id'), function() {
            jweb.init_entries_table();
            if (callback) 
                callback();
        });
    },


    // select an entry in the entrytable
    select_entry: function(entry) {
        $.log("selecting entry: " + entry);
        // toggle selection highlight
        if (jweb.selected_entry)
            $(jweb.selected_entry).removeClass("selected");
        jweb.selected_entry = entry;
        $(jweb.selected_entry).addClass("selected");

        // load entry content
        $("#entrycontent").load("/entry/" + $(entry).attr("id"));
    },

    
    // create new entry
    new_entry: function() {
        folder = jweb.selected_folder;
        $("#entrycontent").empty().load("/newentry?folder=" + $(jweb.selected_folder).attr('id'), function() {
            $("input[@name=name]").focus();
        });
    },

};



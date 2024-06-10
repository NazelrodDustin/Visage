#region System(don't mess with these)

global.__tomeFileArray = [];
global.__tomeAdditionalSidebarItemsArray = [];
global.__tomeHomepage = "Homepage";
global.__tomeLatestDocVersion = "Current-Version";
global.__tomeNavbarItemsArray = [];

#endregion

/*
	Add all the files you wish to be parsed here!
	                                              */
tome_set_site_description("visage-documentation");
tome_set_site_name("Visage");
tome_set_site_latest_version("Beta");
tome_set_site_theme_color("#53ed6d");

tome_add_navbar_link("Download Visage", "https://github.com/NazelrodDustin/Visage");

tome_add_note("Deps");
tome_add_to_sidebar("Scribble", "https://www.jujuadams.com/Scribble/#/8.7/", "External Dependencies");
tome_add_to_sidebar("Input", "https://google.com", "External Dependencies");

tome_add_script(_visage);

tome_add_script(__visageElement);
tome_add_script(_visageContainer);
tome_add_script(_visageWindow);

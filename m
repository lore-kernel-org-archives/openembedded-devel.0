Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A00C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:35:30 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.33329.1710725720870314963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 1903C6211C
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:35:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm1uF-1umqsz0; Mon, 18 Mar 2024 02:35:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-software: update 45.3 -> 46.0
Date: Mon, 18 Mar 2024 02:35:34 +0100
Message-ID: <20240318013534.2058559-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710725715-D6FFA93F-2D575C9C/0/0 CLEAN NORMAL
X-TOI-MSGID: a9a89bb5-64ad-4c0c-8067-b15079e27cf7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 01:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109396

- drop backport patches

Version 46.0
~~~~~~~~~~~~
Released: 2024-03-15

This is a stable release with the following changes:
 * Improvements for screen readers
 * Stop =E2=80=98loading updates=E2=80=99 in a loop on Debian

This release also updates translations:
 * Czech (Daniel Rusek)
 * Danish (Alan Mortensen)
 * Finnish (Jiri Gr=C3=B6nroos)
 * French (Vincent Chatelain)
 * Galician (Fran Dieguez)
 * Georgian (Ekaterine Papava)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Indonesian (Kukuh Syafaat)
 * Korean (Seong-ho Cho)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Persian (Danial Behzadi)
 * Polish (Piotr Dr=C4=85g)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Russian (Artur S0)
 * Swedish (Anders Jonsson)
 * Thai (Aefgh Threenine)
 * Turkish (Emin Tufan =C3=87etin)

Version 46~rc
~~~~~~~~~~~~~
Released: 2024-03-01

This is an unstable release with the following changes:
 * Various UI text improvements
 * Fix launch of some apps
 * Fix invalid app state after it's uninstalled
 * Fix read of app description text
 * Do not ask to reboot after failed firmware update

This release also updates translations:
 * Basque (Asier Sarasua Garmendia)
 * Belarusian (Vasil Pupkin)
 * Bokm=C3=A5l, Norwegian (Brage Fuglseth)
 * Catalan (Jordi Mas, Quique Serrano)
 * Chinese (China) (Boyuan Yang)
 * Czech (Daniel Rusek)
 * Dutch (Nathan Follens)
 * English (United Kingdom) (Andi Chandler)
 * Galician (Fran Dieguez)
 * Georgian (Ekaterine Papava)
 * German (J=C3=BCrgen Benvenuti, Philipp Kiemle)
 * Hebrew (Yaron Shahrabani)
 * Indonesian (Kukuh Syafaat)
 * Kazakh (Baurzhan Muftakhidinov)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Lithuanian (Aurimas =C4=8Cernius)
 * Occitan (post 1500) (Quentin PAG=C3=88S)
 * Persian (Danial Behzadi)
 * Russian (Artur S0)
 * Slovenian (Matej Urban=C4=8Di=C4=8D)
 * Spanish (Daniel Mustieles)
 * Thai (Aefgh Threenine)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)

Version 46~beta
~~~~~~~~~~~~~~~
Released: 2024-02-09

This is an unstable release with the following changes:
 * Show feedback for all conditions that pause automatic updates
 * Various UI improvements and move to new libadwaita widgets
 * Fix loading OS AppStream catalog data if it is available as YAML
 * Add openSUSE Leap distro upgrade plugin

This release also updates translations:
 * Basque (Asier Sarasua Garmendia)
 * Belarusian (Vasil Pupkin)
 * Czech (Daniel Rusek)
 * Galician (Fran Dieguez)
 * Hebrew (Yosef Or Boczko)
 * Persian (Danial Behzadi)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Russian (Artur S0)
 * Turkish (Sabri =C3=9Cnal)

Version 46~alpha
~~~~~~~~~~~~~~~~
Released: 2024-01-05

This is an unstable release with the following changes:
 * Recognize links in package update descriptions
 * Expose package names discreetly in the UI
 * Increase speed of load of the category pages
 * Improve search match with multiple words
 * Recognize verified apps by Flathub
 * Correct message when installing firmware updates
 * Improve application safety checks
 * Improve update preferences dialog
 * Fix deadlock when cancelling app update
 * Support user installation of local flatpak files
 * Fix apps appearing unsorted and without tiles in category page

This release also updates translations:
 * Basque (Asier Sarasua Garmendia)
 * Chinese (China) (Boyuan Yang)
 * Chinese (Taiwan) (Andre Klapper)
 * Czech (Daniel Rusek)
 * Friulian (Fabio Tomat)
 * Georgian (Ekaterine Papava)
 * German (J=C3=BCrgen Benvenuti)
 * Hebrew (Yosef Or Boczko)
 * Persian (Danial Behzadi)
 * Romanian (Florentina Mu=C8=99at)
 * Russian (Artur S0)
 * Turkish (Emin Tufan =C3=87etin, Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)
 * Vietnamese (Ng=E1=BB=8Dc Qu=C3=A2n Tr=E1=BA=A7n)
---
 ...f358ed0e8455e12d9634f60bc4dbaee434e3.patch | 504 ------------------
 ...ab003f3fabf616b6eb7dc93f8967bc9473e5.patch |  31 --
 ...oftware_45.3.bb =3D> gnome-software_46.0.bb} |   6 +-
 3 files changed, 1 insertion(+), 540 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e/0655f358ed0e8455e12d9634f60bc4dbaee434e3.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e/e431ab003f3fabf616b6eb7dc93f8967bc9473e5.patch
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_45.3.bb =3D=
> gnome-software_46.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0655f=
358ed0e8455e12d9634f60bc4dbaee434e3.patch b/meta-gnome/recipes-gnome/gnom=
e-software/gnome-software/0655f358ed0e8455e12d9634f60bc4dbaee434e3.patch
deleted file mode 100644
index 5e051be15..000000000
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0655f358ed0e=
8455e12d9634f60bc4dbaee434e3.patch
+++ /dev/null
@@ -1,504 +0,0 @@
-From 0655f358ed0e8455e12d9634f60bc4dbaee434e3 Mon Sep 17 00:00:00 2001
-From: Matthias Klumpp <matthias@tenstral.net>
-Date: Sun, 8 Oct 2023 20:22:44 +0200
-Subject: [PATCH] Adjust to build with AppStream 1.0 as well as 0.16.x
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-software=
/-/commit/0655f358ed0e8455e12d9634f60bc4dbaee434e3]
----
- lib/gs-app.c                             |  4 ++
- lib/gs-appstream.c                       | 61 +++++++++++++++++++-----
- lib/gs-utils.c                           |  8 ++--
- meson.build                              | 22 +--------
- plugins/core/gs-plugin-appstream.c       |  8 ----
- plugins/fwupd/gs-fwupd-app.c             |  8 ++++
- plugins/fwupd/gs-plugin-fwupd.c          |  4 ++
- src/gs-hardware-support-context-dialog.c |  6 +++
- src/gs-repos-dialog.c                    |  4 ++
- src/gs-screenshot-carousel.c             |  4 +-
- src/gs-screenshot-image.c                | 41 ++++++++++++----
- src/gs-screenshot-image.h                |  7 +++
- subprojects/appstream.wrap               |  2 +-
- 13 files changed, 122 insertions(+), 57 deletions(-)
-
-diff --git a/lib/gs-app.c b/lib/gs-app.c
-index 2308de504d..ea348f8c01 100644
---- a/lib/gs-app.c
-+++ b/lib/gs-app.c
-@@ -609,7 +609,11 @@ gs_app_to_string_append (GsApp *app, GString *str)
- 		AsScreenshot *ss =3D g_ptr_array_index (priv->screenshots, i);
- 		g_autofree gchar *key =3D NULL;
- 		tmp =3D as_screenshot_get_caption (ss);
-+#if AS_CHECK_VERSION(1, 0, 0)
-+		im =3D as_screenshot_get_image (ss, 0, 0, 1);
-+#else
- 		im =3D as_screenshot_get_image (ss, 0, 0);
-+#endif
- 		if (im =3D=3D NULL)
- 			continue;
- 		key =3D g_strdup_printf ("screenshot-%02u", i);
-diff --git a/lib/gs-appstream.c b/lib/gs-appstream.c
-index deca176dcf..6504d6f25e 100644
---- a/lib/gs-appstream.c
-+++ b/lib/gs-appstream.c
-@@ -1011,8 +1011,11 @@ gs_appstream_refine_app_relation (GsApp          =
 *app,
- 			as_relation_set_item_kind (relation, AS_RELATION_ITEM_KIND_CONTROL);
- 			as_relation_set_value_control_kind (relation, as_control_kind_from_s=
tring (xb_node_get_text (child)));
- 		} else if (g_str_equal (item_kind, "display_length")) {
--			AsDisplayLengthKind display_length_kind;
- 			const gchar *compare;
-+			const gchar *side;
-+#if !AS_CHECK_VERSION(1, 0, 0)
-+			AsDisplayLengthKind display_length_kind;
-+#endif
-=20
- 			/* https://www.freedesktop.org/software/appstream/docs/chap-Metadata=
.html#tag-relations-display_length */
- 			as_relation_set_item_kind (relation, AS_RELATION_ITEM_KIND_DISPLAY_L=
ENGTH);
-@@ -1020,15 +1023,21 @@ gs_appstream_refine_app_relation (GsApp         =
  *app,
- 			compare =3D xb_node_get_attr (child, "compare");
- 			as_relation_set_compare (relation, (compare !=3D NULL) ? as_relation=
_compare_from_string (compare) : AS_RELATION_COMPARE_GE);
-=20
-+#if AS_CHECK_VERSION(1, 0, 0)
-+			side =3D xb_node_get_attr (child, "side");
-+			as_relation_set_display_side_kind (relation, (side !=3D NULL) ? as_d=
isplay_side_kind_from_string (side) : AS_DISPLAY_SIDE_KIND_SHORTEST);
-+			as_relation_set_value_px (relation, xb_node_get_text_as_uint (child)=
);
-+#else
- 			display_length_kind =3D as_display_length_kind_from_string (xb_node_=
get_text (child));
- 			if (display_length_kind !=3D AS_DISPLAY_LENGTH_KIND_UNKNOWN) {
- 				/* Ignore the `side` attribute */
- 				as_relation_set_value_display_length_kind (relation, display_length=
_kind);
- 			} else {
--				const gchar *side =3D xb_node_get_attr (child, "side");
-+				side =3D xb_node_get_attr (child, "side");
- 				as_relation_set_display_side_kind (relation, (side !=3D NULL) ? as_=
display_side_kind_from_string (side) : AS_DISPLAY_SIDE_KIND_SHORTEST);
- 				as_relation_set_value_px (relation, xb_node_get_text_as_uint (child=
));
- 			}
-+#endif
- 		} else {
- 			g_debug ("Relation type =E2=80=98%s=E2=80=99 not currently supported=
 for %s; ignoring",
- 				 item_kind, gs_app_get_id (app));
-@@ -1472,7 +1481,7 @@ gs_appstream_refine_app (GsPlugin *plugin,
- }
-=20
- typedef struct {
--	AsSearchTokenMatch	 match_value;
-+	guint16			 match_value;
- 	XbQuery			*query;
- } GsAppstreamSearchHelper;
-=20
-@@ -1522,7 +1531,7 @@ gs_appstream_silo_search_component (GPtrArray *arr=
ay, XbNode *component, const g
- }
-=20
- typedef struct {
--	AsSearchTokenMatch	match_value;
-+	guint16			match_value;
- 	const gchar		*xpath;
- } Query;
-=20
-@@ -1539,6 +1548,11 @@ gs_appstream_do_search (GsPlugin *plugin,
- 	g_autoptr(GPtrArray) array =3D g_ptr_array_new_with_free_func ((GDestr=
oyNotify) gs_appstream_search_helper_free);
- 	g_autoptr(GPtrArray) components =3D NULL;
- 	g_autoptr(GTimer) timer =3D g_timer_new ();
-+#if AS_CHECK_VERSION(1, 0, 0)
-+	const guint16 component_id_weight =3D as_utils_get_tag_search_weight (=
"id");
-+#else
-+	const guint16 component_id_weight =3D AS_SEARCH_TOKEN_MATCH_ID;
-+#endif
-=20
- 	g_return_val_if_fail (GS_IS_PLUGIN (plugin), FALSE);
- 	g_return_val_if_fail (XB_IS_SILO (silo), FALSE);
-@@ -1585,7 +1599,7 @@ gs_appstream_do_search (GsPlugin *plugin,
- 			 * Drop the ID token from it as it=E2=80=99s the highest
- 			 * numeric value but isn=E2=80=99t visible to the user in the
- 			 * UI, which leads to confusing results ordering. */
--			gs_app_set_match_value (app, match_value & (~AS_SEARCH_TOKEN_MATCH_I=
D));
-+			gs_app_set_match_value (app, match_value & (~component_id_weight));
- 			gs_app_list_add (list, app);
-=20
- 			if (gs_app_get_kind (app) =3D=3D AS_COMPONENT_KIND_ADDON) {
-@@ -1624,18 +1638,32 @@ gs_appstream_search (GsPlugin *plugin,
- 		     GCancellable *cancellable,
- 		     GError **error)
- {
-+#if AS_CHECK_VERSION(1, 0, 0)
-+	guint16 pkgname_weight =3D as_utils_get_tag_search_weight ("pkgname");
-+	guint16 name_weight =3D as_utils_get_tag_search_weight ("name");
-+	guint16 id_weight =3D as_utils_get_tag_search_weight ("id");
- 	const Query queries[] =3D {
--		#ifdef HAVE_AS_SEARCH_TOKEN_MATCH_MEDIATYPE
--		{ AS_SEARCH_TOKEN_MATCH_MEDIATYPE,	"mimetypes/mimetype[text()~=3Dstem=
(?)]" },
--		#else
--		{ AS_SEARCH_TOKEN_MATCH_MIMETYPE,	"mimetypes/mimetype[text()~=3Dstem(=
?)]" },
--		#endif
-+		{ as_utils_get_tag_search_weight ("mediatype"),	"provides/mediatype[t=
ext()~=3Dstem(?)]" },
- 		/* Search once with a tokenize-and-casefold operator (`~=3D`) to supp=
ort casefolded
- 		 * full-text search, then again using substring matching (`contains()=
`), to
- 		 * support prefix matching. Only do the prefix matches on a few field=
s, and at a
- 		 * lower priority, otherwise things will get confusing.
--		 *=20
-+		 *
- 		 * See https://gitlab.gnome.org/GNOME/gnome-software/-/issues/2277 */
-+		{ pkgname_weight,				"pkgname[text()~=3Dstem(?)]" },
-+		{ pkgname_weight / 2,				"pkgname[contains(text(),stem(?))]" },
-+		{ as_utils_get_tag_search_weight ("summary"),	"summary[text()~=3Dstem=
(?)]" },
-+		{ name_weight,					"name[text()~=3Dstem(?)]" },
-+		{ name_weight / 2,				"name[contains(text(),stem(?))]" },
-+		{ as_utils_get_tag_search_weight ("keyword"),	"keywords/keyword[text(=
)~=3Dstem(?)]" },
-+		{ id_weight,					"id[text()~=3Dstem(?)]" },
-+		{ id_weight,					"launchable[text()~=3Dstem(?)]" },
-+		{ as_utils_get_tag_search_weight ("origin"),	"../components[@origin~=3D=
stem(?)]" },
-+		{ 0,						NULL }
-+	};
-+#else
-+	const Query queries[] =3D {
-+		{ AS_SEARCH_TOKEN_MATCH_MEDIATYPE,	"mimetypes/mimetype[text()~=3Dstem=
(?)]" },
- 		{ AS_SEARCH_TOKEN_MATCH_PKGNAME,	"pkgname[text()~=3Dstem(?)]" },
- 		{ AS_SEARCH_TOKEN_MATCH_PKGNAME / 2,	"pkgname[contains(text(),stem(?)=
)]" },
- 		{ AS_SEARCH_TOKEN_MATCH_SUMMARY,	"summary[text()~=3Dstem(?)]" },
-@@ -1647,6 +1675,7 @@ gs_appstream_search (GsPlugin *plugin,
- 		{ AS_SEARCH_TOKEN_MATCH_ORIGIN,		"../components[@origin~=3Dstem(?)]" =
},
- 		{ AS_SEARCH_TOKEN_MATCH_NONE,		NULL }
- 	};
-+#endif
-=20
- 	return gs_appstream_do_search (plugin, silo, values, queries, list, ca=
ncellable, error);
- }
-@@ -1659,11 +1688,21 @@ gs_appstream_search_developer_apps (GsPlugin *pl=
ugin,
- 				    GCancellable *cancellable,
- 				    GError **error)
- {
-+#if AS_CHECK_VERSION(1, 0, 0)
-+	const Query queries[] =3D {
-+		{ as_utils_get_tag_search_weight ("pkgname"), "developer/name[text()~=
=3Dstem(?)]" },
-+		{ as_utils_get_tag_search_weight ("summary"), "project_group[text()~=3D=
stem(?)]" },
-+		/* for legacy support */
-+		{ as_utils_get_tag_search_weight ("pkgname"), "developer_name[text()~=
=3Dstem(?)]" },
-+		{ 0,					      NULL }
-+	};
-+#else
- 	const Query queries[] =3D {
- 		{ AS_SEARCH_TOKEN_MATCH_PKGNAME,	"developer_name[text()~=3Dstem(?)]" =
},
- 		{ AS_SEARCH_TOKEN_MATCH_SUMMARY,	"project_group[text()~=3Dstem(?)]" }=
,
- 		{ AS_SEARCH_TOKEN_MATCH_NONE,		NULL }
- 	};
-+#endif
-=20
- 	return gs_appstream_do_search (plugin, silo, values, queries, list, ca=
ncellable, error);
- }
-diff --git a/lib/gs-utils.c b/lib/gs-utils.c
-index cf9073025f..19e6ebd046 100644
---- a/lib/gs-utils.c
-+++ b/lib/gs-utils.c
-@@ -1694,9 +1694,9 @@ gs_utils_gstring_replace (GString *str,
- 			  const gchar *find,
- 			  const gchar *replace)
- {
--	#ifdef HAVE_AS_GSTRING_REPLACE_WITH_FOUR_ARGS
-+#if AS_CHECK_VERSION(1, 0, 0)
- 	as_gstring_replace (str, find, replace, 0);
--	#else
--	as_gstring_replace (str, find, replace);
--	#endif
-+#else
-+	as_gstring_replace2 (str, find, replace, 0);
-+#endif
- }
-diff --git a/meson.build b/meson.build
-index bc19669dd5..8c82464cdb 100644
---- a/meson.build
-+++ b/meson.build
-@@ -113,7 +113,7 @@ add_project_arguments('-D_GNU_SOURCE', language : 'c=
')
- conf.set('HAVE_LINUX_UNISTD_H', cc.has_header('linux/unistd.h'))
-=20
- appstream =3D dependency('appstream',
--  version : '>=3D 0.14.0',
-+  version : '>=3D 0.16.4',
-   fallback : ['appstream', 'appstream_dep'],
-   default_options : [
-     'docs=3Dfalse',
-@@ -121,26 +121,6 @@ appstream =3D dependency('appstream',
-     'install-docs=3Dfalse'
-   ]
- )
--if appstream.type_name() =3D=3D 'internal'
--else
--  if meson.get_compiler('c').has_header_symbol('appstream.h', 'AS_SEARC=
H_TOKEN_MATCH_MEDIATYPE', dependencies: appstream)
--    conf.set('HAVE_AS_SEARCH_TOKEN_MATCH_MEDIATYPE', '1')
--  endif
--  if meson.get_compiler('c').has_header_symbol('appstream.h', 'AS_FORMA=
T_STYLE_CATALOG', dependencies: appstream)
--    conf.set('HAVE_AS_FORMAT_STYLE_CATALOG', '1')
--  endif
--  if meson.get_compiler('c').has_function('as_metadata_components_to_ca=
talog', prefix: '#include <appstream.h>', dependencies: appstream)
--    conf.set('HAVE_AS_METADATA_COMPONENTS_TO_CATALOG', '1')
--  endif
--  if meson.get_compiler('c').links('''#include <appstream.h>
--      int main (void)
--      {
--         as_gstring_replace (NULL, "a", "b", 0);
--         return 0;
--      }''', name: 'as_gstring_replace() has four arguments', dependenci=
es: appstream)
--    conf.set('HAVE_AS_GSTRING_REPLACE_WITH_FOUR_ARGS', '1')
--  endif
--endif
-=20
- gdk_pixbuf =3D dependency('gdk-pixbuf-2.0', version : '>=3D 2.32.0')
- libxmlb =3D dependency('xmlb', version : '>=3D 0.1.7', fallback : ['lib=
xmlb', 'libxmlb_dep'])
-diff --git a/plugins/core/gs-plugin-appstream.c b/plugins/core/gs-plugin=
-appstream.c
-index cf9f3022b1..ef3226a591 100644
---- a/plugins/core/gs-plugin-appstream.c
-+++ b/plugins/core/gs-plugin-appstream.c
-@@ -414,11 +414,7 @@ gs_plugin_appstream_load_dep11_cb (XbBuilderSource =
*self,
- 	if (bytes =3D=3D NULL)
- 		return NULL;
-=20
--	#ifdef HAVE_AS_FORMAT_STYLE_CATALOG
- 	as_metadata_set_format_style (mdata, AS_FORMAT_STYLE_CATALOG);
--	#else
--	as_metadata_set_format_style (mdata, AS_FORMAT_STYLE_COLLECTION);
--	#endif
- 	as_metadata_parse_bytes (mdata,
- 				 bytes,
- 				 AS_FORMAT_KIND_YAML,
-@@ -428,11 +424,7 @@ gs_plugin_appstream_load_dep11_cb (XbBuilderSource =
*self,
- 		return NULL;
- 	}
-=20
--	#ifdef HAVE_AS_METADATA_COMPONENTS_TO_CATALOG
- 	xml =3D as_metadata_components_to_catalog (mdata, AS_FORMAT_KIND_XML, =
&tmp_error);
--	#else
--	xml =3D as_metadata_components_to_collection (mdata, AS_FORMAT_KIND_XM=
L, &tmp_error);
--	#endif
- 	if (xml =3D=3D NULL) {
- 		// This API currently returns NULL if there is nothing to serialize, =
so we
- 		// have to test if this is an error or not.
-diff --git a/plugins/fwupd/gs-fwupd-app.c b/plugins/fwupd/gs-fwupd-app.c
-index 6dcda6ee92..5d3254da59 100644
---- a/plugins/fwupd/gs-fwupd-app.c
-+++ b/plugins/fwupd/gs-fwupd-app.c
-@@ -164,7 +164,11 @@ gs_fwupd_app_set_from_device (GsApp *app,
- 		gs_app_set_install_date (app, fwupd_device_get_created (dev));
- 	if (fwupd_device_get_description (dev) !=3D NULL) {
- 		g_autofree gchar *tmp =3D NULL;
-+#if AS_CHECK_VERSION(1, 0, 0)
-+		tmp =3D as_markup_convert (fwupd_device_get_description (dev), AS_MAR=
KUP_KIND_TEXT, NULL);
-+#else
- 		tmp =3D as_markup_convert_simple (fwupd_device_get_description (dev),=
 NULL);
-+#endif
- 		if (tmp !=3D NULL)
- 			gs_app_set_description (app, GS_APP_QUALITY_NORMAL, tmp);
- 	}
-@@ -402,7 +406,11 @@ gs_fwupd_app_set_from_release (GsApp *app, FwupdRel=
ease *rel)
- 	}
- 	if (fwupd_release_get_description (rel) !=3D NULL) {
- 		g_autofree gchar *tmp =3D NULL;
-+#if AS_CHECK_VERSION(1, 0, 0)
-+		tmp =3D as_markup_convert (fwupd_release_get_description (rel), AS_MA=
RKUP_KIND_TEXT, NULL);
-+#else
- 		tmp =3D as_markup_convert_simple (fwupd_release_get_description (rel)=
, NULL);
-+#endif
- 		if (tmp !=3D NULL)
- 			gs_app_set_update_details_text (app, tmp);
- 	}
-diff --git a/plugins/fwupd/gs-plugin-fwupd.c b/plugins/fwupd/gs-plugin-f=
wupd.c
-index d8c0cd2dd4..a9b05028a0 100644
---- a/plugins/fwupd/gs-plugin-fwupd.c
-+++ b/plugins/fwupd/gs-plugin-fwupd.c
-@@ -727,7 +727,11 @@ gs_plugin_add_updates (GsPlugin *plugin,
- 				g_autofree gchar *desc =3D NULL;
- 				if (fwupd_release_get_description (rel) =3D=3D NULL)
- 					continue;
-+#if AS_CHECK_VERSION(1, 0, 0)
-+				desc =3D as_markup_convert (fwupd_release_get_description (rel), AS=
_MARKUP_KIND_TEXT, NULL);
-+#else
- 				desc =3D as_markup_convert_simple (fwupd_release_get_description (r=
el), NULL);
-+#endif
- 				if (desc =3D=3D NULL)
- 					continue;
- 				g_string_append_printf (update_desc,
-diff --git a/src/gs-hardware-support-context-dialog.c b/src/gs-hardware-=
support-context-dialog.c
-index 0e48c8c266..14653401de 100644
---- a/src/gs-hardware-support-context-dialog.c
-+++ b/src/gs-hardware-support-context-dialog.c
-@@ -461,6 +461,7 @@ gs_hardware_support_context_dialog_get_display_suppo=
rt (GdkMonitor     *monitor,
- 			AsRelationCompare comparator =3D as_relation_get_compare (relation);
- 			Range current_display_comparand, relation_comparand;
-=20
-+#if !AS_CHECK_VERSION(1, 0, 0)
- 			/* From https://www.freedesktop.org/software/appstream/docs/chap-Met=
adata.html#tag-requires-recommends-display_length */
- 			Range display_lengths[] =3D {
- 				[AS_DISPLAY_LENGTH_KIND_XSMALL] =3D { 0, 360 },
-@@ -469,6 +470,7 @@ gs_hardware_support_context_dialog_get_display_suppo=
rt (GdkMonitor     *monitor,
- 				[AS_DISPLAY_LENGTH_KIND_LARGE] =3D { 1024, 3840 },
- 				[AS_DISPLAY_LENGTH_KIND_XLARGE] =3D { 3840, G_MAXUINT },
- 			};
-+#endif
-=20
- 			any_display_relations_set =3D TRUE;
-=20
-@@ -485,11 +487,14 @@ gs_hardware_support_context_dialog_get_display_sup=
port (GdkMonitor     *monitor,
- 			case AS_DISPLAY_SIDE_KIND_LAST:
- 			default:
- 				current_display_comparand.min =3D current_display_comparand.max =3D=
 MAX (current_screen_size.width, current_screen_size.height);
-+#if !AS_CHECK_VERSION(1, 0, 0)
- 				relation_comparand.min =3D display_lengths[as_relation_get_value_di=
splay_length_kind (relation)].min;
- 				relation_comparand.max =3D display_lengths[as_relation_get_value_di=
splay_length_kind (relation)].max;
-+#endif
- 				break;
- 			}
-=20
-+#if !AS_CHECK_VERSION(1, 0, 0)
- 			if (evaluate_display_comparison (display_lengths[AS_DISPLAY_LENGTH_K=
IND_SMALL], comparator, relation_comparand)) {
- 				*mobile_relation_kind_out =3D max_relation_kind (*mobile_relation_k=
ind_out, as_relation_get_kind (relation));
- 				*mobile_match_out =3D TRUE;
-@@ -499,6 +504,7 @@ gs_hardware_support_context_dialog_get_display_suppo=
rt (GdkMonitor     *monitor,
- 				*desktop_relation_kind_out =3D max_relation_kind (*desktop_relation=
_kind_out, as_relation_get_kind (relation));
- 				*desktop_match_out =3D TRUE;
- 			}
-+#endif
-=20
- 			if (evaluate_display_comparison (current_display_comparand, comparat=
or, relation_comparand)) {
- 				*current_relation_kind_out =3D max_relation_kind (*current_relation=
_kind_out, as_relation_get_kind (relation));
-diff --git a/src/gs-repos-dialog.c b/src/gs-repos-dialog.c
-index c41c4944a1..7dac0416d9 100644
---- a/src/gs-repos-dialog.c
-+++ b/src/gs-repos-dialog.c
-@@ -154,7 +154,11 @@ enable_repo (GsReposDialog *dialog,
- 		g_autoptr(GError) error =3D NULL;
-=20
- 		/* convert from AppStream markup */
-+#if AS_CHECK_VERSION(1, 0, 0)
-+		message =3D as_markup_convert (gs_app_get_agreement (repo), AS_MARKUP=
_KIND_TEXT, &error);
-+#else
- 		message =3D as_markup_convert_simple (gs_app_get_agreement (repo), &e=
rror);
-+#endif
- 		if (message =3D=3D NULL) {
- 			/* failed, so just try and show the original markup */
- 			message =3D g_strdup (gs_app_get_agreement (repo));
-diff --git a/src/gs-screenshot-carousel.c b/src/gs-screenshot-carousel.c
-index 04bbf86a1e..d269af6605 100644
---- a/src/gs-screenshot-carousel.c
-+++ b/src/gs-screenshot-carousel.c
-@@ -141,8 +141,8 @@ gs_screenshot_carousel_load_screenshots (GsScreensho=
tCarousel *self, GsApp *app,
- 		gtk_widget_set_can_focus (gtk_widget_get_first_child (ssimg), FALSE);
- 		gs_screenshot_image_set_screenshot (GS_SCREENSHOT_IMAGE (ssimg), ss);
- 		gs_screenshot_image_set_size (GS_SCREENSHOT_IMAGE (ssimg),
--					      AS_IMAGE_NORMAL_WIDTH,
--					      AS_IMAGE_NORMAL_HEIGHT);
-+					      GS_IMAGE_NORMAL_WIDTH,
-+					      GS_IMAGE_NORMAL_HEIGHT);
- 		gtk_widget_add_css_class (ssimg, "screenshot-image-main");
- 		gs_screenshot_image_load_async (GS_SCREENSHOT_IMAGE (ssimg), cancella=
ble);
-=20
-diff --git a/src/gs-screenshot-image.c b/src/gs-screenshot-image.c
-index 93dba68f96..6b4db03d06 100644
---- a/src/gs-screenshot-image.c
-+++ b/src/gs-screenshot-image.c
-@@ -293,13 +293,13 @@ gs_screenshot_image_save_downloaded_img (GsScreens=
hotImage *ssimg,
- 	if (images->len > 1)
- 		return TRUE;
-=20
--	if (width =3D=3D AS_IMAGE_THUMBNAIL_WIDTH &&
--	    height =3D=3D AS_IMAGE_THUMBNAIL_HEIGHT) {
--		width =3D AS_IMAGE_NORMAL_WIDTH;
--		height =3D AS_IMAGE_NORMAL_HEIGHT;
-+	if (width =3D=3D GS_IMAGE_THUMBNAIL_WIDTH &&
-+	    height =3D=3D GS_IMAGE_THUMBNAIL_HEIGHT) {
-+		width =3D GS_IMAGE_NORMAL_WIDTH;
-+		height =3D GS_IMAGE_NORMAL_HEIGHT;
- 	} else {
--		width =3D AS_IMAGE_THUMBNAIL_WIDTH;
--		height =3D AS_IMAGE_THUMBNAIL_HEIGHT;
-+		width =3D GS_IMAGE_THUMBNAIL_WIDTH;
-+		height =3D GS_IMAGE_THUMBNAIL_HEIGHT;
- 	}
-=20
- 	width *=3D ssimg->scale;
-@@ -591,16 +591,30 @@ gs_screenshot_image_get_url (GsScreenshotImage *ss=
img)
- 	} else if (as_screenshot_get_media_kind (ssimg->screenshot) =3D=3D AS_=
SCREENSHOT_MEDIA_KIND_IMAGE) {
- 		AsImage *im;
-=20
-+#if AS_CHECK_VERSION(1, 0, 0)
-+		im =3D as_screenshot_get_image (ssimg->screenshot,
-+					      ssimg->width,
-+					      ssimg->height,
-+					      ssimg->scale);
-+#else
- 		im =3D as_screenshot_get_image (ssimg->screenshot,
- 					      ssimg->width * ssimg->scale,
- 					      ssimg->height * ssimg->scale);
-+#endif
-=20
- 		/* if we've failed to load a HiDPI image, fallback to LoDPI */
- 		if (im =3D=3D NULL && ssimg->scale > 1) {
- 			ssimg->scale =3D 1;
-+#if AS_CHECK_VERSION(1, 0, 0)
-+			im =3D as_screenshot_get_image (ssimg->screenshot,
-+						      ssimg->width,
-+						      ssimg->height,
-+						      1);
-+#else
- 			im =3D as_screenshot_get_image (ssimg->screenshot,
- 						      ssimg->width,
- 						      ssimg->height);
-+#endif
- 		}
-=20
- 		if (im)
-@@ -707,15 +721,22 @@ gs_screenshot_image_load_async (GsScreenshotImage =
*ssimg,
- 	 * smaller version of it straight away */
- 	if (!ssimg->showing_image &&
- 	    as_screenshot_get_media_kind (ssimg->screenshot) =3D=3D AS_SCREENS=
HOT_MEDIA_KIND_IMAGE &&
--	    ssimg->width > AS_IMAGE_THUMBNAIL_WIDTH &&
--	    ssimg->height > AS_IMAGE_THUMBNAIL_HEIGHT) {
-+	    ssimg->width > GS_IMAGE_THUMBNAIL_WIDTH &&
-+	    ssimg->height > GS_IMAGE_THUMBNAIL_HEIGHT) {
- 		const gchar *url_thumb;
- 		g_autofree gchar *basename_thumb =3D NULL;
- 		g_autofree gchar *cache_kind_thumb =3D NULL;
- 		AsImage *im;
-+#if AS_CHECK_VERSION(1, 0, 0)
- 		im =3D as_screenshot_get_image (ssimg->screenshot,
--					      AS_IMAGE_THUMBNAIL_WIDTH * ssimg->scale,
--					      AS_IMAGE_THUMBNAIL_HEIGHT * ssimg->scale);
-+					      GS_IMAGE_THUMBNAIL_WIDTH,
-+					      GS_IMAGE_THUMBNAIL_HEIGHT,
-+					      ssimg->scale);
-+#else
-+		im =3D as_screenshot_get_image (ssimg->screenshot,
-+					      GS_IMAGE_THUMBNAIL_WIDTH * ssimg->scale,
-+					      GS_IMAGE_THUMBNAIL_HEIGHT * ssimg->scale);
-+#endif
- 		url_thumb =3D as_image_get_url (im);
- 		basename_thumb =3D gs_screenshot_get_cachefn_for_url (url_thumb);
- 		cache_kind_thumb =3D g_build_filename ("screenshots", "112x63", NULL)=
;
-diff --git a/src/gs-screenshot-image.h b/src/gs-screenshot-image.h
-index 1f6cf81ce6..6e45f5d20a 100644
---- a/src/gs-screenshot-image.h
-+++ b/src/gs-screenshot-image.h
-@@ -21,6 +21,13 @@ G_BEGIN_DECLS
-=20
- G_DECLARE_FINAL_TYPE (GsScreenshotImage, gs_screenshot_image, GS, SCREE=
NSHOT_IMAGE, GtkWidget)
-=20
-+#define GS_IMAGE_LARGE_HEIGHT		423
-+#define GS_IMAGE_LARGE_WIDTH		752
-+#define GS_IMAGE_NORMAL_HEIGHT		351
-+#define GS_IMAGE_NORMAL_WIDTH		624
-+#define GS_IMAGE_THUMBNAIL_HEIGHT	63
-+#define GS_IMAGE_THUMBNAIL_WIDTH 	112
-+
- GtkWidget	*gs_screenshot_image_new		(SoupSession		*session);
-=20
- AsScreenshot	*gs_screenshot_image_get_screenshot	(GsScreenshotImage	*ss=
img);
-diff --git a/subprojects/appstream.wrap b/subprojects/appstream.wrap
-index 6f0beb0cbc..b9a9c7dbe5 100644
---- a/subprojects/appstream.wrap
-+++ b/subprojects/appstream.wrap
-@@ -1,5 +1,5 @@
- [wrap-git]
- directory =3D appstream
- url =3D https://github.com/ximion/appstream.git
--revision =3D v0.14.1
-+revision =3D v0.16.4
- depth =3D 1
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software/e431a=
b003f3fabf616b6eb7dc93f8967bc9473e5.patch b/meta-gnome/recipes-gnome/gnom=
e-software/gnome-software/e431ab003f3fabf616b6eb7dc93f8967bc9473e5.patch
deleted file mode 100644
index b7bddc324..000000000
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software/e431ab003f3f=
abf616b6eb7dc93f8967bc9473e5.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e431ab003f3fabf616b6eb7dc93f8967bc9473e5 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Wed, 22 Nov 2023 09:44:40 +0100
-Subject: [PATCH] gs-appstream: Remove use of AS_PROVIDED_KIND_PYTHON_2
-
-It's dropped in appstream 1.0.0 and it's not used anywhere in the gnome-=
software
-code, thus just remove it, rather than have it only for pre-1.0.0 appstr=
eam version.
-
-Closes https://gitlab.gnome.org/GNOME/gnome-software/-/issues/2388
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-software=
/-/commit/e431ab003f3fabf616b6eb7dc93f8967bc9473e5]
----
- lib/gs-appstream.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/lib/gs-appstream.c b/lib/gs-appstream.c
-index 6504d6f25..4fd7f5334 100644
---- a/lib/gs-appstream.c
-+++ b/lib/gs-appstream.c
-@@ -587,8 +587,6 @@ gs_appstream_refine_add_provides (GsApp *app, XbNode=
 *component, GError **error)
- 					kind =3D AS_PROVIDED_KIND_FIRMWARE_RUNTIME;
- 				else if (g_strcmp0 (fw_type, "flashed") =3D=3D 0)
- 					kind =3D AS_PROVIDED_KIND_FIRMWARE_FLASHED;
--			} else if (g_strcmp0 (element_name, "python2") =3D=3D 0) {
--				kind =3D AS_PROVIDED_KIND_PYTHON_2;
- 			} else if (g_strcmp0 (element_name, "python3") =3D=3D 0) {
- 				kind =3D AS_PROVIDED_KIND_PYTHON;
- 			} else if (g_strcmp0 (element_name, "dbus") =3D=3D 0) {
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.bb
index 4beb79f1b..40a7141fc 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.0.bb
@@ -28,11 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI +=3D " \
-	file://0655f358ed0e8455e12d9634f60bc4dbaee434e3.patch \
-	file://e431ab003f3fabf616b6eb7dc93f8967bc9473e5.patch \
-"
-SRC_URI[archive.sha256sum] =3D "d6b9245b22237da7bd1739dd28c23cc8f3835f99=
fa10c1037d9dd7635335251c"
+SRC_URI[archive.sha256sum] =3D "11893002bbb54082896683707bc3991ae55a2f30=
40811a760e3a92c96544f86e"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.44.0



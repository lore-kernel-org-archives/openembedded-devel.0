Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Njg1m-00072U-Rf
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 22:41:21 +0100
Received: by bwz5 with SMTP id 5so1981569bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 13:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=+UyMwvgLT0i2HUmMxpeKlDopTdkDVqQVTIjnzVazVnY=;
	b=bPSYIWj6WpBn6z0/+ZJEFjZWK3dSg9N0VukWoewaCl6BjZACIqXVlQ7x5xEw6dMnZz
	gLqJaajfdCKEGM44b23kpYNdj89wv69CVdMEuqnOBx7IZpT9eM0c5saAdhQpbGFr15lf
	APDe+eJ1H55nUPDkaVq/g7vcvJV1gY8Lv2WIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=h6nwD0v/MnLOEmQfwIvEEo1LK1InQ9a5sBEbpz/VFKSCsegYgsihKq07ICFbsFIENB
	v011tUtoPu1AWJcONjFCn2iDlM+rvRel+WF3M6zm5DO9R01fSszo++rlBL1I4nQNTGLP
	2mpNP+0FPYwI33hTEwXn2ikAEt4hM2A8hp6QM=
Received: by 10.204.14.86 with SMTP id f22mr500244bka.107.1266874711307;
	Mon, 22 Feb 2010 13:38:31 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 14sm1383539bwz.2.2010.02.22.13.38.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 13:38:30 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Njg3z-0003Ap-GW; Mon, 22 Feb 2010 22:43:35 +0100
Date: Mon, 22 Feb 2010 22:43:35 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100222214335.GB30265@mx.loc>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
	<20100222181754.GB24049@jama> <20100222194159.GZ30265@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100222194159.GZ30265@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2010 21:41:22 -0000
X-Groupsio-MsgNum: 16958
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 22, 2010 at 08:41:59PM +0100, Bernhard Reutner-Fischer wrote:
>On Mon, Feb 22, 2010 at 07:17:54PM +0100, Martin Jansa wrote:
>>On Mon, Feb 22, 2010 at 10:06:00AM -0700, Chris Larson wrote:
>>> On Mon, Feb 22, 2010 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
>>> > On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
>>> >> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote:
>>> >> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>>> >> > ---
>>> >> >  recipes/git/git.inc |    2 +-
>>> >> >  1 files changed, 1 insertions(+), 1 deletions(-)
>>> >> >
>>> >> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
>>> >> > index 644e159..fd7b708 100644
>>> >> > --- a/recipes/git/git.inc
>>> >> > +++ b/recipes/git/git.inc
>>> >> > @@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
>>> >> >  SECTION = "console/utils"
>>> >> >  LICENSE = "GPL"
>>> >> >
>>> >> > -SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
>>> >> > +SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"
>>> >>
>>> >> Is there a patch to add checksums in corresponding recipes to use the name? Or
>>> >> what is the purpose of adding one?
>>> >
>>> > I guess the idea is to make it possible for new recipes (which use
>>> > this .inc file) to include their own checksums.  Seems like a reasonable
>>> > enough plan even if the old recipes are not converted.
>>> 
>>> Has anyone thought about programmatically injecting a name to the
>>> first tarball/zip in the SRC_URI if no sources have that name yet?  It
>>> seems like adding a name to the primary tarball is becoming common
>>> boilerplate, and the common case is for that to be the first source.
>
>For recipes that have only one fetched source, could we perhaps default
>to plain SRC_URI[md5sum], without a name. If a second fetched source is
>added, this would transparently break (i.e. require adding two names).
>>
>>Also would be great to have unified names where possible.
>
>For recipes that have two or more fetched sources, i personally would
>use PN but, as you say, that has the disadvantage that you have to
>potentially lookup the package name in an .inc. Not my call though.
>
>>It would make adding new recipes a bit easier (no need to
>>check/copy&paster name used in .inc and also base.bbclass could easily
>>generate those checksum sections with right name easier.
>>
>>I'm using "archive" as few others also used.
>
>and some use tarball, some pn ....

Not using "archive" as Martin likes as default, but uri%d, but
what do you all think about the attached proposal (including docs!:)?

cheers,

PS: does the ftps fetcher work, i didn't bother to try, i admit..
docs seem to be inconsistent about it WRT wget..

--opJtzjQTFsWo+cga
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="default_checksums_SRC_URI.00.patch"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index c8ee722..769cf2d 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -61,11 +61,15 @@ def base_chk_file_vars(parser, localpath, params, data):
         name = params["name"]
     except KeyError:
         return False
-    flagName = "%s.md5sum" % name
-    want_md5sum = bb.data.getVarFlag("SRC_URI", flagName, data)
-    flagName = "%s.sha256sum" % name
-    want_sha256sum = bb.data.getVarFlag("SRC_URI", flagName, data)
-
+    if name:
+        md5flag = "%s.md5sum" % name
+        sha256flag = "%s.sha256sum" % name
+    else:
+        md5flag = "md5sum"
+        sha256flag = "sha256sum"
+    want_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
+    want_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
+    bb.note("sha=%s, md5=%s" % (want_md5sum, want_sha256sum))
     if (want_sha256sum == None and want_md5sum == None):
         # no checksums to check, nothing to do
         return False
@@ -702,12 +706,21 @@ python base_do_fetch() {
 	pn = bb.data.getVar('PN', d, True)
 
 	# Check each URI
+	uri_num = 0
 	for url in src_uri.split():
 		localpath = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
 		(type,host,path,_,_,params) = bb.decodeurl(url)
 		uri = "%s://%s%s" % (type,host,path)
 		try:
 			if type in [ "http", "https", "ftp", "ftps" ]:
+				# We provide a default shortcut of plain [] for the first fetch uri
+				# and default to uri%d for subsequent fetch uris.
+				# Explicit names in any uri overrides this default.
+				if not "name" in params:
+					if uri_num:
+						params["name"] = "uri%d" % uri_num
+					else:
+						params["name"] = ""
 				if not (base_chk_file_vars(parser, localpath, params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
 					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
 						bb.fatal("%s-%s: %s has no checksum defined, cannot check archive integrity" % (pn,pv,uri))
@@ -715,6 +728,7 @@ python base_do_fetch() {
 						bb.note("%s-%s: %s has no checksum defined, archive integrity not checked" % (pn,pv,uri))
 		except Exception:
 			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
+		uri_num += 1
 }
 
 addtask fetchall after do_fetch
diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index a35e1ee..132bce8 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -29,7 +29,16 @@
   be used in preference to retrieving a new version . Any source that is
   retrieved from a remote URI will be stored in the download source directory
   and an appropriate md5 sum generated and stored alongside it.</para>
-
+  <para>Checksums for http/https/ftp/ftps uris are stored in each recipe in
+  the form of<screen>SRC_URI[md5sum] = &quot;9a7a11ffd52d9c4553ea8c0134a6fa86&quot;
+SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31701921b9434&quot;</screen>
+  for the first remote SRC_URI that has <emphasis>no</emphasis> explicit <command>name=foo</command>
+  associated with it. Following <emphasis>unnamed</emphasis> SRC_URIs default to<screen>
+SRC_URI[uri1.md5sum] =
+SRC_URI[uri1.sha256sum] =
+SRC_URI[uri2.md5sum] =
+SRC_URI[uri2.sha256sum] =</screen>
+  etc.</para>
   <para>Each URI supports a set of additional options. These options are
   tag/value pairs of the form <command>"a=b"</command> and are semi-colon
   separated from each other and from the URI. The follow examples shows two
@@ -38,7 +47,7 @@
 
   <variablelist>
     <varlistentry>
-      <term>http, https, ftps</term>
+      <term>http, https, ftp, ftps</term>
 
       <listitem>
         <para>Used to download files and source code via the specified URL.
@@ -164,6 +173,7 @@
         <term>md5sum</term>
 
         <listitem>
+          <para><note>DEPRECATED<!-- isn't it? --></note></para>
           <para>If an md5sum is provided then the downloaded files will only
           be considered valid if the md5sum of the downloaded file matches the
           md5sum option provided.</para>

--opJtzjQTFsWo+cga--

Received: from mail-bw0-f224.google.com ([209.85.218.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgHTD-0008Ht-CK
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 13:51:38 +0100
Received: by bwz24 with SMTP id 24so1415432bwz.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 04:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AWY2LVNk93vGVTQDZn9yaC73eQKfi48Nz4zdCQEfZDw=;
	b=xDvKER2AzYFnuyvH74CrLWMVWSDlg7WQrnKBkRHlQthE0iXgCEWBQlbgzW67Jz6ir2
	/8rKmZn1AmQpxG3mbLxBTBKPs2OJGSygeX2x02nS0xlldZvN4Yzo44M25XJ6Qnz8lQLs
	GnsEnZHxYiSSUSc7pfZ8iBz89ak3oFZ5MP6mA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HoxNbwZPDc3AxG/iYOBXnlfol9EVYEEjksjYwewnUYsttq2GEhwPVDtvouPLvhFdA0
	B7a3oqABcWK224Py1VKkTKERVjjzIXqvsQQyCKuFT01frjJntaZSIUsv2Y0CHALxPLgH
	RxIcC/dtgbvsuTAVdSpUa05yAd5vBhgEFkpH0=
Received: by 10.204.36.71 with SMTP id s7mr1661347bkd.171.1266065339342;
	Sat, 13 Feb 2010 04:48:59 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 15sm1921144bwz.0.2010.02.13.04.48.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 04:48:58 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgHTO-0001q6-4X; Sat, 13 Feb 2010 13:51:46 +0100
Date: Sat, 13 Feb 2010 13:51:46 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213125146.GJ10632@mx.loc>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1265892781.3777.1050.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.224
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Sat, 13 Feb 2010 12:51:38 -0000
X-Groupsio-MsgNum: 16742
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 12:53:01PM +0000, Phil Blundell wrote:
>On Wed, 2010-02-10 at 21:13 +0100, Bernhard Reutner-Fischer wrote:
>> xz is the lzma successor
>> tested with automake-1.11.1, autoconf-2.65
>
>Thanks for the patch.  I think this could use a little cleanup before it
>is committed, though; please see below.

I flagged it as RFC in the summary, so yes, like the summary said, still
needs love..
>
>> index 0000000..bc5e9ff
>> --- /dev/null
>> +++ b/recipes/xz/xz-native.inc
>> @@ -0,0 +1,2 @@
>> +inherit native
>> +require xz_${PV}.bb
>
>You could consider using BBCLASSEXTEND to eliminate the need for this
>separate recipe.

Thanks for that, good thing. This will trim down alot on the number of
recipes in the tree!
>
>> diff --git a/recipes/xz/xz-native_4.999.9beta.bb b/recipes/xz/xz-native_4.999.9beta.bb
>> new file mode 100644
>> index 0000000..c4f0da9
>> --- /dev/null
>> +++ b/recipes/xz/xz-native_4.999.9beta.bb
>> @@ -0,0 +1,3 @@
>> +PV = "4.999.9beta"
>> +
>> +require xz-native.inc
>
>Is it necessary to set PV here?  I would have thought base.bbclass would
>infer that same value from the filename.

It was needed since above xz-native.inc had
require xz_${PV}.inc
in it, and if i didn't set PV before it, it defaulted to 1.0, breaking
horribly for obvious reasons. BBCLASSEXTEND nullifies this. Ditched.
>
>> diff --git a/recipes/xz/xz-native_git.bb b/recipes/xz/xz-native_git.bb
>> new file mode 100644
>> index 0000000..006b9d7
>> --- /dev/null
>> +++ b/recipes/xz/xz-native_git.bb
>> @@ -0,0 +1,7 @@
>> +# XZ_BASE should be the latest released version of xz.
>> +# It can be set in the distro file.
>> +#XZ_BASE ?= "4.999.9"
>> +#SRCREV = "HEAD"
>> +#PV = "${XZ_BASE}+gitr${SRCREV}"
>
>Please don't leave this sort of stuff commented out in the file.  If
>it's not needed, just delete those lines.

dropped.
>
>> +#FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/xz-${PV}"
>
>Likewise for that.

ditto (RFC..)
>
>> --- /dev/null
>> +++ b/recipes/xz/xz_4.999.9beta.bb
>> @@ -0,0 +1,8 @@
>> +PV = "4.999.9beta"
>
>See above regarding PV.
>
>> +
>> +require xz.inc
>> +PR = "${INC_PR}.0"
>> +SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
>
>Wouldn't that SRC_URI be better in the .inc file?  Presumably this is
>the correct URI for everything except the _git version.

It would indeed. Can i somehow say
file1: SRC="http:://one.ext/one.tar.xz"
       SRC[md5sum]=md5
       SRC[sha256sum]=sha256
       or, perhaps it's the basename if there was no ;name=
       SRC[one.tar.xz.md5sum]=md5
       SRC[one.tar.xz.sha256sum]=sha256
file2: SRC="git://two"
inc: FOO_SRC ?= SRC
     SRC_URI += FOO_SRC

?
>
>> +SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
>> +SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
>> +EXTRA_OECONF = "--enable-shared"
>
>Likewise for that EXTRA_OECONF, I would have thought that would also
>belong in the .inc really.

the EXTRA_OECONF can. Done.
Revised patch is attached, but:
it works for the 4.999beta9 version (literally, since that's how
upstream calls the tarball; Is this a problem with the version-naming
like Koon indicates?) but not if you
PREFERRED_VERSION_xz = "git"
PREFERRED_VERSION_xz-native = "git"
and then bake xz-native:
NOTE: Task failed: Fetch failed: [snip]; git read-tree 1 failed with
signal 128, output:
fatal: Not a valid object name 1

since: $ ls -a ../sources/git/ctrl.tukaani.org.xz.git/
.  ..  1  .git

"1" ?!

--jRHKVT23PllUwdXP
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0007-xz-add-xz-package.00b.patch"

diff --git a/recipes/xz/xz.inc b/recipes/xz/xz.inc
new file mode 100644
index 0000000..cc4f966
--- /dev/null
+++ b/recipes/xz/xz.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "XZ Utils is free general-purpose data compression software with high compression ratio.  XZ Utils are the successor to LZMA Utils."
+SECTION = "console/utils"
+LICENSE = "Public Domain"
+INC_PR = "r0"
+S ?= "${WORKDIR}/xz-${PV}"
+EXTRA_OECONF = "--enable-shared"
+BBCLASSEXTEND = "native"
+
+inherit autotools
diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
new file mode 100644
index 0000000..8733023
--- /dev/null
+++ b/recipes/xz/xz_4.999.9beta.bb
@@ -0,0 +1,5 @@
+require xz.inc
+PR = "${INC_PR}.0"
+SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
+SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
+SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
diff --git a/recipes/xz/xz_git.bb b/recipes/xz/xz_git.bb
new file mode 100644
index 0000000..8950a08
--- /dev/null
+++ b/recipes/xz/xz_git.bb
@@ -0,0 +1,6 @@
+S = "${WORKDIR}/git"
+require xz.inc
+PV = "git"
+PR = "${INC_PR}.0"
+SRC_URI = "git://ctrl.tukaani.org/xz.git;branch=master;protocol=git"
+DEFAULT_PREFERENCE = "-1"

--jRHKVT23PllUwdXP--

Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QypE7-0002RP-EI for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 20:09:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyp9O-00012M-Fq for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 20:04:34 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 20:04:34 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 20:04:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 20:04:21 +0200
Message-ID: <j3lt35$gb3$1@dough.gmane.org>
References: <cover.1314710525.git.otavio@ossystems.com.br>
	<04a735b690f58a4b9f0eaf0b1e243f0b806a4500.1314710525.git.otavio@ossystems.com.br>
	<CAP9ODKpc5dXL5kcOGHjEFRmgrcWq81n0wgpofxG_No8HwC8FuA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <CAP9ODKpc5dXL5kcOGHjEFRmgrcWq81n0wgpofxG_No8HwC8FuA@mail.gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][PATCH 1/2] json-glib: drop specific recipe to use OpenEmbedded-Core
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
X-List-Received-Date: Wed, 31 Aug 2011 18:09:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 18:40, Otavio Salvador schreef:
> Ping?

applied, thanks

> 
> On Tue, Aug 30, 2011 at 10:42, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
>> .../recipes-devtools/json-glib/json-glib_0.10.4.bb |   14
>> -------------- 1 files changed, 0 insertions(+), 14 deletions(-) delete
>> mode 100644 meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
>> 
>> diff --git a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
>> b/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb deleted file
>> mode 100644 index 87c60cb..0000000 ---
>> a/meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb +++ /dev/null 
>> @@ -1,14 +0,0 @@ -DESCRIPTION = "JSON-GLib is a library providing
>> serialization and deserialization support for the JavaScript Object
>> Notation (JSON) format" -LICENSE = "LGPLv2.1" -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34" -DEPENDS =
>> "glib-2.0" - -PR = "r1" - -EXTRA_OECONF = "--enable-introspection=no" 
>> - -inherit autotools -SRC_URI =
>> "http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.10/json-glib-0.10.4.tar.gz"
>>
>> 
- -
>> -SRC_URI[md5sum] = "87677e939a4b3d42e1c56b2a3046b9bb" 
>> -SRC_URI[sha256sum] =
>> "9561b3c58b350c89333d154f1e8669b8ece611c9c724252aed0e6273cda9cc6f" -- 
>> 1.7.2.5
>> 
>> 
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXnelMkyGM64RGpERAiXEAKCBEppl6F68OHMqWvfQf2Wm70NFFQCfbXmD
ladXLSZar8tJcVbv5n0BkD4=
=0H/+
-----END PGP SIGNATURE-----




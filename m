Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <neo.freerunner@googlemail.com>) id 1OtRIq-0001pS-IU
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:31:55 +0200
Received: by bwz12 with SMTP id 12so539497bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type; bh=HtN5MJ4WfonZ8Kp89vTQ5CUiR/RmH5XiRMTW/Rf2ex0=;
	b=te2t/EWsSIQn4n6I8Zh+486l5JXgSYandvX5rTEv4fpFgqXAcOiIhPvU3i9vhMOcuN
	OLfpnKseck+7ikoBtFcE6bNoZ7CFAwP0gbAesVFTrszPHHXMjzb8cE+xLAg72J7DnQ5E
	u2PFOj5mQLCDSXdERi/2xz6fR6PyS5RQcH65A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=UAxPQuQl5C5iUtjhCfthb/q06FNtEYOHEYOdQOBmGhOqPxNR6MGEWxMLUXviQjzSTh
	ZPb+Ffaw0nMqAcUjwzb/fDtL5eEqPrjjdn/s4ycWgnAZfRY7NpHDYJKoDkvvhgzzryV+
	ya/m70GcSU2pQCvB8Evwyb53kD1h51R321Y/k=
Received: by 10.204.57.146 with SMTP id c18mr341823bkh.205.1283977848155;
	Wed, 08 Sep 2010 13:30:48 -0700 (PDT)
Received: from [192.168.0.13] (port-92-204-98-156.dynamic.qsc.de
	[92.204.98.156])
	by mx.google.com with ESMTPS id y2sm403973bkx.20.2010.09.08.13.30.46
	(version=SSLv3 cipher=RC4-MD5); Wed, 08 Sep 2010 13:30:47 -0700 (PDT)
Message-ID: <4C87F276.2080104@googlemail.com>
Date: Wed, 08 Sep 2010 22:30:46 +0200
From: Peter Klassen <neo.freerunner@googlemail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinxEPBjSeAwF+MWJB-tyX1WMoeW+oMCUR84EKZg@mail.gmail.com>
	<4C85164B.4050704@gravedo.de>
In-Reply-To: <4C85164B.4050704@gravedo.de>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: neo.freerunner@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xserver-xorg-conf/palmpre/xorg.conf
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
X-List-Received-Date: Wed, 08 Sep 2010 20:32:01 -0000
X-Groupsio-MsgNum: 23349
Content-Type: multipart/mixed; boundary="------------030600010104020905060902"

--------------030600010104020905060902
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hey,

okay I've changed the commit message.

best
Peter



On 06.09.2010 18:26, Simon Busch wrote:
> On 06.09.2010 17:57, Peter Klassen wrote:
>   
>> Hey devs,
>>
>> attached to this mail you will find a pathch for xorg-conf
>> to support palm pre.
>> This is my very first patch ever, so I hope I havent't build in any
>> faux pas
>>
>> best
>> Peter
>>     
> You should change the commit line to something like "xserver-xorg-conf:
> add xorg.conf for palmpre machine" to indicate which recipe your are
> changing with this patch. If you change this detail:
> Acked-by: Simon Busch <morphis@gravedo.de>
>
> regards,
> morphis
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


--------------030600010104020905060902
Content-Type: text/x-patch;
 name="palmpre-xorg-conf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="palmpre-xorg-conf.patch"

From 16559df664ab8ca8d61f6b08d5880a8a155dee7b Mon Sep 17 00:00:00 2001
From: Peter Klassen <pklassen@web.de>
Date: Mon, 6 Sep 2010 16:29:31 +0200
Subject: [PATCH] xserver-xorg-conf:
 add xorg.conf for palmpre machine

---
 .../xserver-xorg-conf/palmpre/xorg.conf            |   44 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
new file mode 100644
index 0000000..822b2ad
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
@@ -0,0 +1,44 @@
+Section "Module"
+    Load    "extmod" 
+    Load    "dbe"
+    Load    "freetype"
+    Load    "type1"
+    Load    "record"
+    Load    "dri"
+EndSection
+
+Section "Monitor"
+    Identifier  "Builtin Default Monitor"
+EndSection
+
+Section "Device"
+    Identifier  "Builtin Default fbdev Device 0"
+    Driver      "omapfb"
+    Option "fb" "/dev/fb0"
+EndSection
+
+Section "Screen"
+    Identifier  "Builtin Default fbdev Screen 0"
+    Device      "Builtin Default fbdev Device 0"
+    Monitor     "Builtin Default Monitor"
+EndSection
+
+Section "ServerLayout"
+    Identifier  "Builtin Default Layout"
+    Screen      "Builtin Default fbdev Screen 0"
+    InputDevice "Touchscreen" "CorePointer"
+EndSection
+
+Section "InputDevice"
+    Identifier  "Touchscreen"
+    Driver      "tslib"
+    Option      "Device"                "/dev/touchscreen"
+    Option      "CorePointer"           "true"
+    Option      "SendCoreEvents"        "true"
+    Option      "Protocol"              "Auto"
+    Option      "Width"                 "320"
+    Option      "Height"                "480"
+    Option      "EmulateRightButton"    "1"
+    Option      "CorePointer"           "true"
+
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index c15bae6..0b1b60d 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r31"
+PR = "r32"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.0.4


--------------030600010104020905060902--

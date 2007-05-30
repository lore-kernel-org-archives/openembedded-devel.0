Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1HtWuD-00031w-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2007 00:44:38 +0200
Received: by wa-out-1112.google.com with SMTP id l24so996176waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2007 15:42:53 -0700 (PDT)
Received: by 10.114.137.2 with SMTP id k2mr4350054wad.1180564973385;
	Wed, 30 May 2007 15:42:53 -0700 (PDT)
Received: by 10.115.75.15 with HTTP; Wed, 30 May 2007 15:42:53 -0700 (PDT)
Message-ID: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
Date: Wed, 30 May 2007 19:42:53 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: strange error: missing depends...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2007 22:44:38 -0000
X-Groupsio-MsgNum: 2144
Content-Type: multipart/mixed; 
	boundary="----=_Part_10846_26325642.1180564973337"

------=_Part_10846_26325642.1180564973337
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi there,

Some days ago I was using the bitbake1.6 to build my packages and it
was working fine, but someday without any apparently reason it stopped
to work.

Then, after a big looser fight I've decided to change to bitbake1.8
and the problem was apparently solved... I was seeing the packages
being build...
But in the end, for my surprise, I've noticed that a lot of depends
wasn't build!

Since my task file is not under official repository yet I'm sending in
this email.

Does any body have any idea?

Thanks,
vivijim

------=_Part_10846_26325642.1180564973337
Content-Type: application/octet-stream; name=task-mamona.bb
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f2cdtv00
Content-Disposition: attachment; filename="task-mamona.bb"

REVTQ1JJUFRJT04gPSAiTWFtb25hIFRhc2tzIgpTRUNUSU9OID0gIm1hbW9uYS9iYXNlIgpBTExP
V19FTVBUWSA9ICIxIgpQQUNLQUdFX0FSQ0ggPSAiYWxsIgpMSUNFTlNFID0gIkdQTCIKUFJPVklE
RVMgPSAidGFzay1tYW1vbmEtYWxsIgoKUFIgPSAicjEiCgpQQUNLQUdFUyA9ICJcCiAgdGFzay1t
YW1vbmEtYmFzZSBcCiAgbWFtb25hLWRldiBcCiIKClJERVBFTkRTX3Rhc2stbWFtb25hLWFsbCA6
PSAiJHtQQUNLQUdFU30iCgojIE1hbW9uYSBCYXNlOgpERVNDUklQVElPTl90YXNrLW1hbW9uYS1i
YXNlID0gIk1hbW9uYSBCYXNlIEZpbGVzIgpSREVQRU5EU190YXNrLW1hbW9uYS1iYXNlID0gIiBc
CiAgYXB0IFwKICBiYXNlLWZpbGVzIFwKICBiYXNlLXBhc3N3ZCBcCiAgYmFzaCBcCiAgYmludXRp
bHMgXAogIGJ1c3lib3ggXAogIGJ6aXAyIFwKICBjb3JldXRpbHMgXAogIGRwa2cgXAogIGUyZnNw
cm9ncyBcCiAgZTJmc3Byb2dzLWJhZGJsb2NrcyBcCiAgZTJmc3Byb2dzLWJsa2lkIFwKICBlMmZz
cHJvZ3MtdXVpZGdlbiBcCiAgZmlsZSBcCiAgZ2F3ayBcCiAgZ2F3ay1jb21tb24gXAogIGxpYmdj
YzEgXAogIGxpYnN0ZGMrKzYgXAogIHpsaWIgXCAKICBuY3Vyc2VzIFwKICBwZXJsIFwKICBwZXJs
LW1vZHVsZS1iYXNlIFwKICBwZXJsLW1vZHVsZS1jYXJwIFwKICBwZXJsLW1vZHVsZS1leHBvcnRl
ciBcCiAgcGVybC1tb2R1bGUtc3RyaWN0IFwKICBwZXJsLW1vZHVsZS12YXJzIFwKICBwZXJsLW1v
ZHVsZS13YXJuaW5ncyBcCiAgcGVybC1tb2R1bGUtd2FybmluZ3MtcmVnaXN0ZXIgXAogIHByb2Nw
cyBcCiAgc2VkIFwKICBzeXN2aW5pdCBcCiAgc3lzdmluaXQtaW5pdHRhYiBcCiAgdGFyIFwKICB1
ZGV2IFwKICB1cGRhdGUtYWx0ZXJuYXRpdmVzLWRwa2cgXAogIHVwZGF0ZS1yYy5kIFwKICB1dGls
LWxpbnV4IFwKICB1dGlsLWxpbnV4LWxvc2V0dXAgXAogIHV0aWwtbGludXgtc3dhcG9ub2ZmIFwK
ICB1dGlsLWxpbnV4LXVtb3VudCBcCiIKCiMgTWFtb25hIERldjoKREVTQ1JJUFRJT05fbWFtb25h
LWRldiA9ICJNYW1vbmEtZGV2OiBOZWNlc3NhcnkgcGFja2FnZXMgZm9yIGRldmVsb3BtZW50IgpS
REVQRU5EU19tYW1vbmEtZGV2ID0gIiBcCiAgYXV0b21ha2UgXAogIGJpc29uIFwKICBmYWtlcm9v
dCBcCiAgZmxleCBcCiAgZ2NjLXN5bWxpbmtzIFwKICBnZXR0ZXh0IFwKICBncm9mZiBcCiAgbGli
YzYtZGV2IFwKICBtYWtlIFwKIgo=

------=_Part_10846_26325642.1180564973337--

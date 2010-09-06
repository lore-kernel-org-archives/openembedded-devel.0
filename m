Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <neo.freerunner@googlemail.com>) id 1Ose5E-00037b-6F
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 17:58:14 +0200
Received: by wye20 with SMTP id 20so4829539wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=nlPL9D2ONb4D5pfIbp821YbdGB1smFllvtqnsvNphMo=;
	b=WtPi/Esif58bP7NofcjSUuiekFiPD02WQg3GyPRqu/iDzykNPAUNI4J9iCySqZSxLx
	sVolepmzsRdIZPVbGid/moDagL5GxP1JX/sXAsM8dEhhKzOxe+WFSzLawZyHSudwMaR7
	ocnq9jQJcLKLy/67SEzwyKvGZJbSHkF1VbpU8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=d8RFYFRpYLAjtIVuDeHIW/asC0gosEgYhy2gmPCiA2YDTwZmLVO/1lj/y8EeQRCUQL
	Hah0tnedn45Z334wSGJwLt4IW8VhCQuo/NtMmGJMCe/LX20H8RjnwaS0wQaEKe1FTiXT
	fx3/MrPCBJfzl4FgAzeiLypFB9ZET1hnXS+As=
MIME-Version: 1.0
Received: by 10.216.30.207 with SMTP id k57mr178105wea.88.1283788649701; Mon,
	06 Sep 2010 08:57:29 -0700 (PDT)
Received: by 10.216.91.68 with HTTP; Mon, 6 Sep 2010 08:57:29 -0700 (PDT)
Date: Mon, 6 Sep 2010 17:57:29 +0200
Message-ID: <AANLkTinxEPBjSeAwF+MWJB-tyX1WMoeW+oMCUR84EKZg@mail.gmail.com>
From: Peter Klassen <neo.freerunner@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: neo.freerunner@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xserver-xorg-conf/palmpre/xorg.conf
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
X-List-Received-Date: Mon, 06 Sep 2010 15:58:14 -0000
X-Groupsio-MsgNum: 23190
Content-Type: multipart/mixed; boundary=0016e6ddab476ea2df048f995625

--0016e6ddab476ea2df048f995625
Content-Type: text/plain; charset=ISO-8859-1

Hey devs,

attached to this mail you will find a pathch for xorg-conf
to support palm pre.
This is my very first patch ever, so I hope I havent't build in any
faux pas

best
Peter

--0016e6ddab476ea2df048f995625
Content-Type: text/x-patch; charset=US-ASCII; name="palmpre-xorg-conf.patch"
Content-Disposition: attachment; filename="palmpre-xorg-conf.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gdrilgcv0

RnJvbSAxODQ0NzZhMWYyZDU3MjFiYzJmZTYwOWFjYTkxYzI5OWY0Y2NkMGJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRlciBLbGFzc2VuIDxwa2xhc3NlbkB3ZWIuZGU+CkRhdGU6
IE1vbiwgNiBTZXAgMjAxMCAxNjoyOTozMSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHhvcmcuY29u
ZiBmb3IgcGFsbXByZQoKaW5pdGlhbCB4b3JnLmNvbmYgZm9yIHBhbG0gcHJlIHRha2VuIChhbmQg
bW9kaWZpZWQpCmZyb20gZnJlZXNtYXJ0cGhvbmUgZ2l0IHRyZWUKLS0tCiAuLi4veHNlcnZlci14
b3JnLWNvbmYvcGFsbXByZS94b3JnLmNvbmYgICAgICAgICAgICB8ICAgNDQgKysrKysrKysrKysr
KysrKysrKysKIHJlY2lwZXMveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy1jb25mXzAuMS5iYiAg
ICAgIHwgICAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMveG9yZy14c2VydmVyL3hzZXJ2ZXIt
eG9yZy1jb25mL3BhbG1wcmUveG9yZy5jb25mCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnLWNvbmYvcGFsbXByZS94b3JnLmNvbmYgYi9yZWNpcGVzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmctY29uZi9wYWxtcHJlL3hvcmcuY29uZgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwLi44MjJiMmFkCi0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBl
cy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLWNvbmYvcGFsbXByZS94b3JnLmNvbmYKQEAgLTAs
MCArMSw0NCBAQAorU2VjdGlvbiAiTW9kdWxlIgorICAgIExvYWQgICAgImV4dG1vZCIgCisgICAg
TG9hZCAgICAiZGJlIgorICAgIExvYWQgICAgImZyZWV0eXBlIgorICAgIExvYWQgICAgInR5cGUx
IgorICAgIExvYWQgICAgInJlY29yZCIKKyAgICBMb2FkICAgICJkcmkiCitFbmRTZWN0aW9uCisK
K1NlY3Rpb24gIk1vbml0b3IiCisgICAgSWRlbnRpZmllciAgIkJ1aWx0aW4gRGVmYXVsdCBNb25p
dG9yIgorRW5kU2VjdGlvbgorCitTZWN0aW9uICJEZXZpY2UiCisgICAgSWRlbnRpZmllciAgIkJ1
aWx0aW4gRGVmYXVsdCBmYmRldiBEZXZpY2UgMCIKKyAgICBEcml2ZXIgICAgICAib21hcGZiIgor
ICAgIE9wdGlvbiAiZmIiICIvZGV2L2ZiMCIKK0VuZFNlY3Rpb24KKworU2VjdGlvbiAiU2NyZWVu
IgorICAgIElkZW50aWZpZXIgICJCdWlsdGluIERlZmF1bHQgZmJkZXYgU2NyZWVuIDAiCisgICAg
RGV2aWNlICAgICAgIkJ1aWx0aW4gRGVmYXVsdCBmYmRldiBEZXZpY2UgMCIKKyAgICBNb25pdG9y
ICAgICAiQnVpbHRpbiBEZWZhdWx0IE1vbml0b3IiCitFbmRTZWN0aW9uCisKK1NlY3Rpb24gIlNl
cnZlckxheW91dCIKKyAgICBJZGVudGlmaWVyICAiQnVpbHRpbiBEZWZhdWx0IExheW91dCIKKyAg
ICBTY3JlZW4gICAgICAiQnVpbHRpbiBEZWZhdWx0IGZiZGV2IFNjcmVlbiAwIgorICAgIElucHV0
RGV2aWNlICJUb3VjaHNjcmVlbiIgIkNvcmVQb2ludGVyIgorRW5kU2VjdGlvbgorCitTZWN0aW9u
ICJJbnB1dERldmljZSIKKyAgICBJZGVudGlmaWVyICAiVG91Y2hzY3JlZW4iCisgICAgRHJpdmVy
ICAgICAgInRzbGliIgorICAgIE9wdGlvbiAgICAgICJEZXZpY2UiICAgICAgICAgICAgICAgICIv
ZGV2L3RvdWNoc2NyZWVuIgorICAgIE9wdGlvbiAgICAgICJDb3JlUG9pbnRlciIgICAgICAgICAg
ICJ0cnVlIgorICAgIE9wdGlvbiAgICAgICJTZW5kQ29yZUV2ZW50cyIgICAgICAgICJ0cnVlIgor
ICAgIE9wdGlvbiAgICAgICJQcm90b2NvbCIgICAgICAgICAgICAgICJBdXRvIgorICAgIE9wdGlv
biAgICAgICJXaWR0aCIgICAgICAgICAgICAgICAgICIzMjAiCisgICAgT3B0aW9uICAgICAgIkhl
aWdodCIgICAgICAgICAgICAgICAgIjQ4MCIKKyAgICBPcHRpb24gICAgICAiRW11bGF0ZVJpZ2h0
QnV0dG9uIiAgICAiMSIKKyAgICBPcHRpb24gICAgICAiQ29yZVBvaW50ZXIiICAgICAgICAgICAi
dHJ1ZSIKKworRW5kU2VjdGlvbgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnLWNvbmZfMC4xLmJiIGIvcmVjaXBlcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3Jn
LWNvbmZfMC4xLmJiCmluZGV4IGMxNWJhZTYuLjBiMWI2MGQgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy1jb25mXzAuMS5iYgorKysgYi9yZWNpcGVzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmctY29uZl8wLjEuYmIKQEAgLTEsNSArMSw1IEBACiBERVNDUklQ
VElPTiA9ICJNYWNoaW5lIHNwZWNpZmljIHhvcmcuY29uZiBmaWxlcyIKLVBSID0gInIzMSIKK1BS
ID0gInIzMiIKIAogU1JDX1VSSSA9ICJmaWxlOi8veG9yZy5jb25mIgogCi0tIAoxLjcuMC40Cgo=

--0016e6ddab476ea2df048f995625--

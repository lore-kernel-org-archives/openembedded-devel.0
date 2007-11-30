Received: from [150.202.8.1] (helo=dc1gateway.sjm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jtiller@sjm.com>) id 1Ixyfp-00007V-LI
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 06:44:26 +0100
Received: from USSYML02.ad.sjm.com ([150.202.22.59]) by dc1gateway.sjm.com
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 29 Nov 2007 21:41:18 -0800
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 29 Nov 2007 21:41:17 -0800
Message-ID: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
Thread-Topic: Firewall blocking access to monotone server?
Thread-Index: Acgyy2RDXDGIuGyVS66qMCHzXr1zfwAR0Hu9
References: <20071129172123.GA29463@buddha.tw.openmoko.com>
	<474F1835.6060002@student.utwente.nl>
From: "Tiller, Jason" <jtiller@sjm.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 30 Nov 2007 05:41:18.0389 (UTC)
	FILETIME=[A150EE50:01C83313]
Subject: Firewall blocking access to monotone server?
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
X-List-Received-Date: Fri, 30 Nov 2007 05:44:27 -0000
X-Groupsio-MsgNum: 3497
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C83313.A0D20EFF"

------_=_NextPart_001_01C83313.A0D20EFF
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, OE folx!

I approached the list a couple of weeks ago asking about running OE =
under Cygwin.  The overwhelming consensus was that I shouldn't even =
embark on that headache-laden path and instead scare up a Linux box for =
my OE work.  Well, I took your considered advice and now I'm trying to =
get OE running.

I'm running on a 400MHz P-III with 256MB of memory running RHEL 4.  The =
OS is mandated by my IT guys.  I got everything down, finally got =
everything built (well, so far), including git, svn, mtn, boost, =
(1.33.1), bb, and a whole host of other packages.  My poor little box =
has been compiling its little brains out.  I think I have everything in =
place.

I read the tutorial and got stuck at the actual retrieval of the mtn =
database.  I downloaded the mtn 0.36 OE snapshot, but when I try to do =
the first "mtn pull" against monotone.openembedded.org, the connection =
hangs.  It also hangs against the other servers that have been =
mentioned.  I think this is due to our company's draconian firewall =
policy.

If I were to go to my IT guys and ask them (nicely) to help me out, what =
do I need to tell them in terms of the port/protocol issues?  I'll need =
to convince them that this is a safe proposition, but I'm sure exactly =
what I'm asking for.

Thanks in advance.  I *really* want to give this a try since WindRiver =
quoted me $60k+ for a WRLinux distro/tools/support, just for the first =
year.  Geez, I'm the *only* programmer at my site - there's no way my =
boss will fork over that kind of money.  So, I may end up having to roll =
my own.

Wish me luck!

---Jason

------_=_NextPart_001_01C83313.A0D20EFF
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhMFAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEALQAAAEZpcmV3YWxsIGJsb2NraW5n
IGFjY2VzcyB0byBtb25vdG9uZSBzZXJ2ZXI/ALkQAQWAAwAOAAAA1wcLAB0AFQApABEABABZAQEg
gAMADgAAANcHCwAdABUAKQARAAQAWQEBCYABACEAAAA3RUE3QUIzOUJBN0U3NTRFQkU0ODA1QjEw
M0RBNkQyMwBZBwEDkAYAdA0AADkAAAADACYAAAAAAAMANgAAAAAAQAA5AP8O0qATM8gBHgA9AAEA
AAABAAAAAAAAAAIBRwABAAAANgAAAGM9VVM7YT0gO3A9UEFDRVNFVFRFUjtsPVVTU1lNTDAyLTA3
MTEzMDA1NDExN1otMTA2MzQ4AAAAHgBJAAEAAAA7AAAAUmU6IFtvZV0gT0Uvc25hcHNob3RzIGlz
IG5vdCByZWFsbHkgZm9yIGRpZmZlcmVudCBtdG4gdmVyLgAAQABOAICocTTBMsgBHgBaAAEAAAAy
AAAAb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZwAAAAIB
WwABAAAAgQAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAAG9wZW5lbWJlZGRlZC1kZXZlbC1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcAU01UUABvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNl
c0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnAAAAAAIBXAABAAAANwAAAFNNVFA6T1BFTkVNQkVEREVE
LURFVkVMLUJPVU5DRVNATElTVFMuT1BFTkVNQkVEREVELk9SRwAAHgBdAAEAAAAKAAAAS29lbiBL
b29pAAAAAgFeAAEAAABBAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAAS29lbiBLb29pAFNNVFAA
ay5rb29pQHN0dWRlbnQudXR3ZW50ZS5ubAAAAAACAV8AAQAAAB8AAABTTVRQOksuS09PSUBTVFVE
RU5ULlVUV0VOVEUuTkwAAB4AZgABAAAABQAAAFNNVFAAAAAAHgBnAAEAAAAyAAAAb3BlbmVtYmVk
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
QTI5NDYzQGJ1ZGRoYS50dy5vcGVubW9rby5jb20+IDw0NzRGMTgzNS42MDYwMDAyQHN0dWRlbnQu
dXR3ZW50ZS5ubD4AAAAeAEcQAQAAAA8AAABtZXNzYWdlL3JmYzgyMgAACwDyEAEAAAAfAPMQAQAA
AGYAAABGAGkAcgBlAHcAYQBsAGwAIABiAGwAbwBjAGsAaQBuAGcAIABhAGMAYwBlAHMAcwAgAHQA
bwAgAG0AbwBuAG8AdABvAG4AZQAgAHMAZQByAHYAZQByACUAMwBGAC4ARQBNAEwAAAAAAAsA9hAA
AAAAQAAHMAqFLqYSM8gBQAAIMKj63aATM8gBAwDeP69vAAADAPE/CQQAAB4A+D8BAAAADgAAAFRp
bGxlciwgSmFzb24AAAACAfk/AQAAAFEAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089
UEFDRVNFVFRFUi9PVT1TVU5OWVZBTEUvQ049UkVDSVBJRU5UUy9DTj1USUxMRUowMQAAAAAeAPo/
AQAAABUAAABTeXN0ZW0gQWRtaW5pc3RyYXRvcgAAAAACAfs/AQAAAB4AAAAAAAAA3KdAyMBCEBq0
uQgAKy/hggEAAAAAAAAALgAAAAMA/T/kBAAAAwAZQAAAAAADABpAAAAAAAMAHUAAAAAAAwAeQAAA
AAAeADBAAQAAAAkAAABUSUxMRUowMQAAAAAeADFAAQAAAAkAAABUSUxMRUowMQAAAAAeADJAAQAA
ADIAAABvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnAAAA
HgAzQAEAAAAaAAAAay5rb29pQHN0dWRlbnQudXR3ZW50ZS5ubAAAAB4AOEABAAAACQAAAFRJTExF
SjAxAAAAAB4AOUABAAAAAgAAAC4AAAADAHZA/////wsAKQAAAAAACwAjAAAAAAADAAYQfUL+UQMA
BxDQBAAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAEhFTExPLE9FRk9MWElBUFBST0FDSEVE
VEhFTElTVEFDT1VQTEVPRldFRUtTQUdPQVNLSU5HQUJPVVRSVU5OSU5HT0VVTkRFUkNZR1dJTlRI
RU9WRVJXSEVMTUlOR0NPTlNFTlMAAAAAAgF/AAEAAAA9AAAAPEEwQUFDQjAxMUZGMDQ3NDQ5MjA3
MUYzRTcyRkIxODhGOTU4QzVBQFVTU1lNTDAyLmFkLnNqbS5jb20+AAAAAAur

------_=_NextPart_001_01C83313.A0D20EFF--

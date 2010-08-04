Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ogf0W-0006gy-UF
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:31:53 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 4F7FF4656
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 18:36:14 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Aug 2010 18:31:30 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<201008041807.06239.khimov@altell.ru>
	<20100804142147.GE28187@mx.loc>
In-Reply-To: <20100804142147.GE28187@mx.loc>
MIME-Version: 1.0
Message-Id: <201008041831.30860.khimov@altell.ru>
X-Altell-MailScanner-ID: 4F7FF4656.17DC8
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] perl: use only one method all_perl_packages
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
X-List-Received-Date: Wed, 04 Aug 2010 14:31:55 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: base64

0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0KHRgNC10LTQsCAwNCDQsNCy0LPRg9GB0YLQsCAy
MDEwIDE4OjIxOjQ3INCw0LLRgtC+0YAgQmVybmhhcmQgUmV1dG5lci1GaXNjaGVyIArQvdCw0L/Q
uNGB0LDQuzoKPiBPbiBXZWQsIEF1ZyAwNCwgMjAxMCBhdCAwNjowNzowNlBNICswNDAwLCBSb21h
biBJIEtoaW1vdiB3cm90ZToKPiA+0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0KHRgNC10LTQ
sCAwNCDQsNCy0LPRg9GB0YLQsCAyMDEwIDE3OjUxOjU3INCw0LLRgtC+0YAgQmVybmhhcmQKPiA+
IFJldXRuZXItRmlzY2hlcgo+ID4KPiA+0L3QsNC/0LjRgdCw0Ls6Cj4gPj4gLi4gdG8gYXZvaWQK
PiA+PiBFUlJPUjogRXJyb3IgTWV0aG9kIGFscmVhZHkgc2VlbjogYWxsX3BlcmxfcGFja2FnZXMg
aW4nIHBlcmxfNS44LjguYmInCj4gPj4gbm93IGluICdwZXJsXzUuMTAuMS5iYicKPiA+Pgo+ID4+
IFRPRE86IGVycm9yKCkgYWxyZWFkeSBwcmludHMgIkVSUk9SOiIgc28gdGhlICJFcnJvciIgaW4g
YWJvdmUgbXNnIGlzCj4gPj4gcmVkdW5kYW50Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCZXJu
aGFyZCBSZXV0bmVyLUZpc2NoZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4KPiA+Cj4gPldoYXQg
a2luZCBvZiBjb25maWd1cmF0aW9uIGdpdmVzIHlvdSBzdWNoIGFuIGVycm9yPyBOZXZlciBzZWVu
IHRoYXQuCj4gCj4gSXQgd2FzIGFwcGxpZWQgYnkgQ2hyaXMgYXMgYTVkZWU1NzAzM2Y3ZDk5ODc4
NThkMmMwNTE0ZjRlNjg3ZWNlMjg3NAoKUHJvYmFibHkgZDY3YzRlNWJhNDk5YTA1NGY2N2Q2NjU3
MzNkMjlmODczZTQyNmRiOT8gVmVyeSByZWNlbnQgY2hhbmdlLCBnb3QgaXQsIApPSy4K



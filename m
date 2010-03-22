Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ntdte-0000U5-AF
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:26:07 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id DFF2A68778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 11:58:28 +0300 (MSK)
From: Roman Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:22:47 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1268740521-10248-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1268740521-10248-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Message-Id: <201003221222.47668.khimov@altell.ru>
X-Altell-MailScanner-ID: DFF2A68778.C9C2C
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
Subject: Re: [PATCH] kernel.bbclass: fixed dependency calculation with recent modutils
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
X-List-Received-Date: Mon, 22 Mar 2010 09:26:07 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: base64

0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIg0JLRgtC+0YDQvdC40LogMTYg0LzQsNGA0YLQsCAy
MDEwIDE0OjU1OjIxINCw0LLRgtC+0YAgRW5yaWNvIFNjaG9seiDQvdCw0L/QuNGB0LDQuzoKPiAn
ZGVwbW9kJyBmcm9tICByZWNlbnQgbW9kdWxlLWluaXQtdG9vbHMgKHZlcnNpb24gMy45IG9yIGxh
dGVyKSByZXR1cm5zCj4gcGF0aHMgcmVsYXRpdmUgdG8gL2xpYi9tb2R1bGVzL2B1bmFtZSAtcmAu
ICBFLmcuICdtb2R1bGVzLmRlcCcgY29udGFpbgo+IAo+IHwga2VybmVsL2ZzL25mc19jb21tb24v
bmZzX2FjbC5rbzoga2VybmVsL25ldC9zdW5ycGMvc3VucnBjLmtvCj4gCj4gaW5zdGVhZCBvZiBh
YnNvbHV0ZSBwYXRobmFtZXMuCgpJIGd1ZXNzIHdlIG5lZWQgbmV3ZXIgbW9kdWxlLWluaXQtdG9v
bHMgaW4gT0UgdG8gdGVzdCBpdCBwcm9wZXJseS4K



Received: from [157.27.6.133] (helo=mailgw2.univr.it)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <cailotto@sci.univr.it>) id 1Hjv6B-0001Gt-Rz
	for openembedded-devel@openembedded.org; Fri, 04 May 2007 12:33:16 +0200
Received: (qmail 58892 invoked by uid 1010); 4 May 2007 10:33:12 -0000
Received: from cailotto@sci.univr.it by mailgw2.univr.it by uid 1003 with
	qmail-scanner-1.22-st-qms 
	(spamassassin: 2.63.  Clear:RC:1(157.27.252.10):. 
	Processed in 0.056173 secs); 04 May 2007 10:33:12 -0000
X-Antivirus-UNIVR-Mail-From: cailotto@sci.univr.it via mailgw2.univr.it
X-Antivirus-UNIVR: 1.22-st-qms (Clear:RC:1(157.27.252.10):. Processed in
	0.056173 secs Process 58886)
Received: from profs.sci.univr.it (157.27.252.10)
	by mailgw2.univr.it with SMTP; 4 May 2007 10:33:12 -0000
Received: from kai (kai.sci.univr.it [157.27.242.56])
	by profs.sci.univr.it (Postfix) with ESMTP id 6A0478000C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2007 12:33:11 +0200 (CEST)
From: "Stefano Cailotto" <cailotto@sci.univr.it>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 May 2007 12:33:10 +0200
Message-ID: <002a01c78e37$9d165360$38f21b9d@kai>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Thread-Index: AceON5yTPaKklGHCSXah72Vpq0rUag==
X-Mailman-Approved-At: Sat, 05 May 2007 14:27:36 +0200
Subject: OE on Kontron eb425
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2007 10:33:17 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all, 
I'm trying to build something usable for a kontron eb425 board, based on an
intel ixp425.
I tried to compile using a generic ixp4xxbe, but when loading, the kernel
stops after uncompressing reporting a CRC error.
It seems that Kontron EmbeddedLinux development kit performs something on
the kernel before making zImage in order to load it in a specifed memory
location.
I'd like to use OE, anyway, so my questions are:
1) has anyone faced my same problem (possibly with positive results)?
2) is there away to "port" kontron configuration inside OE?I'm looking to
understand how...

Thanx, 
Stefano


---------------------------------------------------------------------------
  Stefano Cailotto - Research Consultant
---------------------------------------------------------------------------
  EDALab - Networked Embedded Systems
  c/o  Dipartimento di Informatica - Universita` di Verona
  Strada le Grazie, 15 - 37134 Verona (Italy)
---------------------------------------------------------------------------
  email: cailotto@sci.univr.it stefano.cailotto@edalab.it      
  web:  http://www.edalab.it
  tel: +39-045-802-7062 fax: +39-045-802-7068
---------------------------------------------------------------------------




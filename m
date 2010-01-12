Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>)
	id 1NUc7m-0005O9-6e; Tue, 12 Jan 2010 09:29:17 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o0C8QTF22045; 
	Tue, 12 Jan 2010 09:26:30 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Tue, 12 Jan 2010 09:10:59 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o0C8Qvg29440; 
	Tue, 12 Jan 2010 09:26:57 +0100 (MET)
Message-ID: <4B4C3253.7040702@atmel.com>
Date: Tue, 12 Jan 2010 09:26:59 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.5) Gecko/20091204 Lightning/1.0b2pre Thunderbird/3.0
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
References: <1263224731-2691-1-git-send-email-nicolas.ferre@atmel.com>
	<hiflqc$b75$1@ger.gmane.org>
In-Reply-To: <hiflqc$b75$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [PATCH] sane-feed.inc: adding some ATMEL boards
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
X-List-Received-Date: Tue, 12 Jan 2010 08:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 11/01/2010 18:06, Koen Kooi :
> On 11-01-10 16:45, Nicolas Ferre wrote:
>> Add some armv5te entries for ATMEL -EK boards.
> 
> FEED_ARCH is deprecated and shouldn't be used any more. I'm surprised it
> spread beyond angstrom after it being deprecated, but I guess that's
> what blind copy-pasting will do for you.

Ok then.

Bye,
-- 
Nicolas Ferre




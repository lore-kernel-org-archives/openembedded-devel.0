Received: from [80.12.242.96] (helo=smtp27.orange.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.romain@laposte.net>) id 1KeXVk-00014I-39
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 17:58:12 +0200
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2716.orange.fr (SMTP Server) with ESMTP id 9C6B01C0008B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 17:55:20 +0200 (CEST)
Received: from [192.168.2.2] (AToulouse-157-1-111-107.w86-221.abo.wanadoo.fr
	[86.221.126.107])
	by mwinf2716.orange.fr (SMTP Server) with ESMTP id 659431C00082
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 17:55:20 +0200 (CEST)
X-ME-UUID: 20080913155520416.659431C00082@mwinf2716.orange.fr
Message-ID: <48CBE436.9050500@laposte.net>
Date: Sat, 13 Sep 2008 18:03:02 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080726)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
In-Reply-To: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 15:58:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Felipe,

Felipe Contreras wrote:
> This is the result of various experiments I've been doing while trying
> to import mtn repositories into git. I've looked into other mtn2git
> scripts but none fitted my needs
Did you take a look at the mtn2git python script available in 
org.openembedded.dev/contrib/mtn2git/mtn2git.py ?
Since it was intended and used to convert the OE monotone repository to 
git, I think it should fit your needs :-)

Best regards,

  Cyril




Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>)
	id 1NUfHj-0007H5-Hb; Tue, 12 Jan 2010 12:51:46 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o0CBmfF19333; 
	Tue, 12 Jan 2010 12:48:58 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Tue, 12 Jan 2010 12:33:12 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o0CBnBg16980; 
	Tue, 12 Jan 2010 12:49:11 +0100 (MET)
Message-ID: <4B4C61B9.80407@atmel.com>
Date: Tue, 12 Jan 2010 12:49:13 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.5) Gecko/20091204 Lightning/1.0b2pre Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org,
	Angstrom Developers List <angstrom-distro-devel@linuxtogo.org>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: kdriver kmode.c policy
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
X-List-Received-Date: Tue, 12 Jan 2010 11:51:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I have a bunch of modelines to add to the kdMonitorTimings table of
kmode.c file (xorg-server : kdrive).

I see that several patches are already modifying this file. I would like
to know what is the proper way to add some modelines without adding "yet
another machine specific patch" ?

thanks for your input.

Best regards,
-- 
Nicolas Ferre




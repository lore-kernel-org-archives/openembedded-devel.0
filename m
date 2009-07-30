Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1MWQFH-0005nH-Tk
	for openembedded-devel@openembedded.org; Thu, 30 Jul 2009 09:40:11 +0200
Received: (qmail 28272 invoked from network); 30 Jul 2009 09:24:52 +0200
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 30 Jul 2009 09:24:52 +0200
Received: (qmail 21581 invoked by uid 9804); 30 Jul 2009 09:24:52 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 30 Jul 2009 09:24:45 +0200
Received: (qmail 21573 invoked by uid 9804); 30 Jul 2009 09:24:45 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 30 Jul 2009 09:24:45 +0200
Received: (qmail 28262 invoked from network); 30 Jul 2009 09:24:45 +0200
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	30 Jul 2009 07:24:45 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1MWQ0L-0003qp-Gl
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 09:24:45 +0200
Date: Thu, 30 Jul 2009 09:24:45 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090730072445.GA14703@mi.fu-berlin.de>
References: <91283b620907292323k97f58c8tab25fd987265d64e@mail.gmail.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[21576](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <91283b620907292323k97f58c8tab25fd987265d64e@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: Advice needed on using Bitbake to make qt project (.pro)	Click to flag this post
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
X-List-Received-Date: Thu, 30 Jul 2009 07:40:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2009 at 07:23:29AM +0100, Stuart Gray wrote:
> Hi,
> 
> I am new to using Bitbake and would like to ask if anyone has links to
> examples on how to get Bitbake to build Qt projects.

Bitbake is not enough to have qt support you also need the openembedded-dev or stable repository.

Here is a short introduction http://wiki.openembedded.net/index.php/Getting_started

Than have a look at classes/qt4e.bbclass inside the openembedded directory and
to get in touch how it works look into my qtnx recipe under recipes/qtnx/qtnx-qte_0.9.bb

Bye Henning



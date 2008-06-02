Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>)
	id 1K3BPg-0006Kl-Tk; Mon, 02 Jun 2008 16:53:32 +0200
Received: from andromeda (e180179024.adsl.alicedsl.de [85.180.179.24])
	by drlauer-research.com (Postfix) with ESMTP id BF604584BD5;
	Mon,  2 Jun 2008 16:50:46 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 2 Jun 2008 16:49:14 +0200
User-Agent: KMail/1.9.9
References: <20080531171735.3C118189300@amethyst.openembedded.net>
In-Reply-To: <20080531171735.3C118189300@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200806021649.15159.mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev dbus 1.2.1: fix pidfile location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 14:53:33 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 31 May 2008 19:17:35 koen commit wrote:
> dbus 1.2.1: fix pidfile location

I'm afraid this patch breaks restartability which I fixed a couple of weeks 
ago. Can you double check whether you can use the init script and restart 
dbus still works?

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



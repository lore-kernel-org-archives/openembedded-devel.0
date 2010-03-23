Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nu242-0001gG-Sa
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 12:14:29 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6ih17x44/SRsYf+cQ/y28xQ1blZVPB5@postini.com;
	Tue, 23 Mar 2010 04:11:20 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip07.e2k.ad.ge.com with ESMTP; 23 Mar 2010 07:11:18 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 23 Mar 2010 07:11:17 -0400
Message-ID: <4BA8A29B.7050909@ge.com>
Date: Tue, 23 Mar 2010 11:14:35 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<20100322093543.27540.54412.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322093543.27540.54412.stgit@ES-J7S4D2J.amer.consind.ge.com>
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 10/12] Add hwclock script to util-linux-ng
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
X-List-Received-Date: Tue, 23 Mar 2010 11:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martyn Welch wrote:
> Busybox provides a script for managing the RTC, this is not provided by
> anything else and will be required for busybox-less builds. Add it to
> util-linux-ng for now

This clearly needs to be a part of the proposed "busybox-alt" recipe,
not util-linux-ng.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189




Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NwzMl-0007Mh-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 16:58:00 +0200
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS7NiNDUnLK30wSDtEDkP5XZa+UFm1TMz@postini.com;
	Wed, 31 Mar 2010 07:54:45 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 31 Mar 2010 10:54:42 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 31 Mar 2010 10:54:42 -0400
Message-ID: <4BB362FF.9010908@ge.com>
Date: Wed, 31 Mar 2010 15:58:07 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BB35552.9070508@mlbassoc.com>
In-Reply-To: <4BB35552.9070508@mlbassoc.com>
X-SA-Exim-Connect-IP: 64.18.0.184
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Wed, 31 Mar 2010 14:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Gary Thomas wrote:
> Has anyone had success building FireFox for a PowerPC
> target - I'm using the development branch (org.openembedded.dev)
>   MACHINE=efika
>   DISTRO = "angstrom-2008.1"
>
> I've tried to build a number of different FireFox packages,
> none with success.  So far I've tried 2.0.0.3, 3.5.2 & 3.6.2
>
> Any pointers?
This any help?:

http://www.ppcnux.com/?q=firefox-360-community-build-for-linux-powerpc
>
> Query: is there an easy way to build a particular package version?
> What I've done is just add a line like this to my local.conf:
>   PREFERRED_VERSION_firefox="3.5.2"
>
> Thanks for any help with this
>


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189




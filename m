Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1P0BMu-0000O7-LH
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 12:55:37 +0200
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTKB4Gwx8D6eecvo65Tm+In5yya6/WAs9@postini.com;
	Mon, 27 Sep 2010 03:55:28 PDT
Received: from unknown (HELO alpmlef08.e2k.ad.ge.com) ([3.159.18.17])
	by Alpmlip05.e2k.ad.ge.com with ESMTP; 27 Sep 2010 05:08:32 -0400
Received: from [3.138.54.92] ([3.138.54.92]) by alpmlef08.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 27 Sep 2010 05:08:31 -0400
Message-ID: <4CA05EBB.6080604@ge.com>
Date: Mon, 27 Sep 2010 10:07:07 +0100
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9CD59D.30301@cbnco.com>
In-Reply-To: <4C9CD59D.30301@cbnco.com>
X-Enigmail-Version: 1.0.1
X-OriginalArrivalTime: 27 Sep 2010 09:08:31.0491 (UTC)
	FILETIME=[8E53BD30:01CB5E23]
X-SA-Exim-Connect-IP: 64.18.0.184
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Minimum python version - 2.4 or 2.5?
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
X-List-Received-Date: Mon, 27 Sep 2010 10:55:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Unless something has changed in he last few months, I think we wanted to
support 2.4 for a little while longer:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06143.html

Martyn

On 24/09/10 17:45, Michael Smith wrote:
> Hi,
> 
> What's the minimum Python version requirement for the dev branch? I'd
> like to use shutil.copytree(), but the behaviour I want was only added
> in Python 2.5.
> 
> Thanks,
> Mike
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square,
Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



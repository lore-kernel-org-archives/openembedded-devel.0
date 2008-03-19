Received: from [64.233.170.190] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Jbwmj-0002I1-8k
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 12:48:48 +0100
Received: by rn-out-0910.google.com with SMTP id s46so211272rnb.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2008 04:48:42 -0700 (PDT)
Received: by 10.151.85.20 with SMTP id n20mr117997ybl.79.1205927321841;
	Wed, 19 Mar 2008 04:48:41 -0700 (PDT)
Received: by 10.151.83.11 with HTTP; Wed, 19 Mar 2008 04:48:41 -0700 (PDT)
Message-ID: <d1b08f940803190448r453770f6q611a1c14b7dd59c9@mail.gmail.com>
Date: Wed, 19 Mar 2008 12:48:41 +0100
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <frqri1$9l5$1@ger.gmane.org>
MIME-Version: 1.0
References: <200803182311.01445.zecke@selfish.org> <frpftj$p9s$1@ger.gmane.org>
	<200803191143.05167.zecke@selfish.org> <frqri1$9l5$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.233.170.190
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The tzdata package and a bug with tzdata-dbg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2008 11:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Holger, Koen,

talking about tzdata, the file /etc/localtime is missing.

I'd suggest you to look at the gentoo-ebuild here for some tips (pkg_config):

http://www.gentoo-portage.com/AJAX/Ebuild/62372/View

Andrea



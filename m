Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCbF-0004bP-Mw
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:22:29 +0100
Received: by yia13 with SMTP id 13so1393830yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=XnEaxs1aWmp6OL3gWZBgD3OAp/exZPCJq1+t/vZnXd8=;
	b=nKpMSxNHEtzqNHj3c8ENmGB/5pKwe5n/irKQ0gvefOBH9fQtzyLkTShizD/G+vHb4R
	v0vGKk+Fk9gRbyAQ6Q4nI2p0A07Da/yZ9os05hr59LCPF6T6YMFyKHbk78Q4Ja4YzPLd
	IdAFsPNqN9HGkHCwqd5evTNFKdBZwwokGMsAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=MH70b8qOxdHYmVBk/owqYokhKXzBR5GDE0ydP5hqAuje/a3SHmUWqCRZ/HTtOHdUwn
	ioPsPMHwqBpwQDllcnLXUlEe2rgeC45Z4KVNvdIsl161yisRZOjjtMeWMh1Cv6HyGGKl
	R46hQ1Duauw4P0vWtiAN3VGxKOZOTi/qjEYVs=
Received: by 10.236.185.33 with SMTP id t21mr3633302yhm.243.1299889247824;
	Fri, 11 Mar 2011 16:20:47 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y73sm3297632yhc.42.2011.03.11.16.20.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:20:47 -0800 (PST)
Date: Fri, 11 Mar 2011 16:21:11 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312002111.GK5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299879658-10136-1-git-send-email-eric@eukrea.com>
	<1299879658-10136-3-git-send-email-eric@eukrea.com>
	<4D7AA712.8080003@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D7AA712.8080003@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/3] qt4: remove 4.7.1
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
X-List-Received-Date: Sat, 12 Mar 2011 00:22:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 15:49), Tom Rini wrote:
> On 03/11/2011 02:40 PM, Eric Bénard wrote:
> >now that 4.7.2 is prefered for shr&  minimal
> >
> 
> Have the X11 images been tested to some degree now?

I could boot demo images fine but x11 images were missing startup
script. I dont have the errors handy but they did not boot into GUI
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem



Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1Qge3s-000138-0t
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 16:35:44 +0200
Received: by iym10 with SMTP id 10so4822825iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2011 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sDFM2Lpcp/neI3x6wW12qENehs8Sjr0SGCs/clswDh4=;
	b=NqOnLtvTKmFD1glPMVr1dKs9/d64pS2QLfcW4poWkbqDzs7yPRGqwAp+aiAQv72SdR
	sL1nidzTmZ8u5+BiBUq37UTz/zDTFrggXXdDS1nHDkfdcrrjOgurssfCiGuvPCwynb2o
	2K/XWV7LFja5fshKfbTUrynJxL0qCKRU/Pizk=
Received: by 10.42.2.212 with SMTP id 20mr6956192icl.318.1310481106207;
	Tue, 12 Jul 2011 07:31:46 -0700 (PDT)
Received: from cverges-dev-lnx ([173.8.168.17])
	by mx.google.com with ESMTPS id x4sm7586567ibm.59.2011.07.12.07.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 07:31:44 -0700 (PDT)
Date: Tue, 12 Jul 2011 07:31:01 -0700
From: Chris Verges <kg4ysn@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20110712143101.GA2392@cverges-dev-lnx>
References: <0564089300001e7d@nedap.com>
	<201107121042.53976.paul.eggleton@linux.intel.com>
	<20110712140847.GA788@cverges-dev-lnx>
	<201107121518.51033.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201107121518.51033.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 14:35:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 12, 2011 at 03:18:50PM +0100, Paul Eggleton wrote:
> Possibly, however as a general suggestion I would recommend moving
> things over to being based on oe-core if at all possible. I realise
> this is not going to be practical for everyone in the short term,
> however OE classic will stop being maintained at some point in the
> near future, so the sooner you move the better - plus you get to take
> advantage of the additional features and cleanups in oe-core as well.

I'd love to.  My most recent project is just starting out, so it's a
good time to make the switch.  Are there any good references for
performing a migration?

Thanks,
Chris




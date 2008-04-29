Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqq7l-0007yo-Cf
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 15:44:01 +0200
Received: by wr-out-0506.google.com with SMTP id 36so5346wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=lNXac5qnRXLEnsVwRDJaR3+eJbqJL4F3R4/xYMQXPeM=;
	b=JmP2YzoiyygY8waE3T0rMF9aOUTjd5RkidrD4P+T27VTFlarsYaJPM5b8RWTL5vMNCeJvHMCRRQD0Vph/T5nmxIYHhkbtnd9Z9ZkEJY0imfFsV0fReyUGR4RKxJKJz8F4/AmkDEbgQmYcljQPAbLcrLPkHMXwZpIG69EM2nJGTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=ZuD4rdnv2/lb9GuWR0W/gHXVc68W9iCR7uvBwQHR4M2pDa2m3oficWvwYholaERsChvO5pTVZWb4owtsgjusm2RPXAmX5R9gYs9KKb286kfv3p0IJXapSuOtFUkNd3HfIrL62eqdoe0gJGK2YQx832R457/gfWuVvj6gbUst3uk=
Received: by 10.101.68.10 with SMTP id v10mr1544820ank.17.1209476612937;
	Tue, 29 Apr 2008 06:43:32 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Tue, 29 Apr 2008 06:43:32 -0700 (PDT)
Message-ID: <c384c5ea0804290643p709b6b18qdf9581ffd744e5f7@mail.gmail.com>
Date: Tue, 29 Apr 2008 15:43:32 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48170F3C.7040409@balister.org>
MIME-Version: 1.0
References: <200804281344.32507.zecke@selfish.org>
	<200804281639.04704.zecke@selfish.org> <fv5nfj$3pg$1@ger.gmane.org>
	<1209457156.5642.9.camel@dax.rpnet.com> <fv7289$ovv$1@ger.gmane.org>
	<48170F3C.7040409@balister.org>
Subject: Re: Summary of an unwanted merge and what I did
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 13:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Tue, Apr 29, 2008 at 2:06 PM, Philip Balister <philip@balister.org> wrote:
>
>  Then there is the school of thought that we should just make everyone
> unhappy and use Visual Source Safe or ClearCase.
>

And then, the vice versa approach:

Did we reach agreement that the move to GIT or Hg will make us happy,
regardless of which one?

Regards,
-- 
Leon



Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KWCAZ-0008NX-Ub
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 17:33:52 +0200
Received: by wr-out-0506.google.com with SMTP id c53so37343wra.20
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Aug 2008 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:sender;
	bh=5uvNcbrn81FKRRzwmKpYbtza6hOMZXgHkEIUm0aW4As=;
	b=PU20dXBJy4kk62N285Ilp9WxRozi2Sp+TQjHfmhvrHuA0X3QrBRrt9YtHj2VHdBLAz
	nE+K1iOIwMOLeRseWv/8NjC8v+PwuSVuWLD05GzMcc74i9ktnKc3FOhBUC+cpkVI3DZX
	28a6FSO2m+mu2nGgQHsjBiRDIyiGE6d4e99ag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding
	:sender;
	b=guxobWqBqZMT4mgLpXMnlSS4fuZgmRASuofnGTITPLJAVQF187Qth8QHwdYf9NK401
	bcQGaWxmOmMF1z2gGtOTsF+rjoOXaG6otO6mwn00MBLYnYImYSTsv5RrqUtoHYfCedSt
	BN5cPhzA3o+rkJLC5tm6xhecuODsRHvR8T1yU=
Received: by 10.90.65.5 with SMTP id n5mr2013695aga.44.1219332761322;
	Thu, 21 Aug 2008 08:32:41 -0700 (PDT)
Received: from ?192.168.2.3? ( [75.121.174.99])
	by mx.google.com with ESMTPS id 38sm62005aga.4.2008.08.21.08.32.39
	(version=SSLv3 cipher=RC4-MD5); Thu, 21 Aug 2008 08:32:40 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8j68u$cst$1@ger.gmane.org>
References: <1219122247.7224.337.camel@dfarning.desktop.org>
	<48AB3572.20804@student.utwente.nl>
	<1219278854.7197.5.camel@dfarning.desktop.org>
	<g8j68u$cst$1@ger.gmane.org>
Date: Thu, 21 Aug 2008 10:32:38 -0500
Message-Id: <1219332758.7212.73.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Sugar Desktop
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
X-List-Received-Date: Thu, 21 Aug 2008 15:33:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-08-21 at 09:42 +0200, Koen Kooi wrote:
> David Farning wrote:
> > Would you please file a bug in the tracker at http://dev.laptop.org/ .
> > We will try to get the situation sorted out.  If You cc me, I will try
> > to push it along.
> 
> Done: http://dev.laptop.org/ticket/8076
> 
> regards,
> 
> Koen

Thanks Koen,

Base on your role in the Open Embedded community, I have ask Marco, our
lead developer, to treat your bugs as blockers to porting Sugar to other
devices.

Until quite recently, we only built for the XO.   Working with others is
not something with which we have a lot of experience.

Thanks
dfarning 




Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NAKav-0000Sz-45
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 10:43:32 +0100
Received: by bwz9 with SMTP id 9so6253508bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 01:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RYDnU4GUqIr08NZ2Cv8GaDn9cgxbq3JjgOReK0WUcoY=;
	b=UMLGmVz4IL99lSrGVo8uY+hUDPmKtRTGEQyHO4ubfVBGpkF7Use5VE1B5TaIrqihkC
	v1AhwhaecDtPt4SLyAHDx/J9R2YvfDZreFscP83mfWsoAHGq3lHo1k0YEeswET1j+PmB
	rx5PDUBbeHuX4XiDqSzQmmKHZzHCW//YsQ5C4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sf1dQQwUMDRAK3wNlC3ezP2sPw6siO2gFcaWZBndd2VF4Cn7wI5Qk2ZMvB09LJSt1d
	XIcB7xgGUOFPQNf6dJLuO5OJoPP+AjHCsSmmKWJgvrGsw8/dkToPL4/ThLO5J6ZXdB6M
	vHW5Bcn2fUamsmSlwjGIUptUpq+RAnQgQoFx0=
Received: by 10.204.10.8 with SMTP id n8mr5079508bkn.48.1258450926245;
	Tue, 17 Nov 2009 01:42:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm283347fxm.2.2009.11.17.01.42.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 01:42:05 -0800 (PST)
Date: Tue, 17 Nov 2009 10:42:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117094209.GG23383@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258375022.16625.3.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Tue, 17 Nov 2009 09:43:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2009 at 12:37:02PM +0000, Richard Purdie wrote:
> Note that converting svn recipes can go ahead as they don't need local
> build revisions, its mainly the distributed SCMS that have a problem
> (e.g. git/hg).

OK pushed first 4 patches, svn recipes should be converted now..

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         



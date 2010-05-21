Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFG78-0004Ic-JA
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 02:29:23 +0200
Received: by pxi14 with SMTP id 14so169742pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Eur0NNeI7qyQKBzI3saXt6BF6Yn9yBP3JP//Bpi9tew=;
	b=qM18cS/kW8geTL6LfT5aPH+50FmUiWtwf2tHw8Gc1acJQjI8MbfYxbK+M2EB0jI+iK
	xEqk9QPRyh6Ui8nIIUJD84YCmt0A5pGws8qOmGz+E6AW5Bw7PBlD+MkkGK1rbGwUuUeO
	ea/nAD4oWMP9zF+t+RDp8Zintd/3a1B+vLcT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oUjdrvSRu5tzb82ZZKDar2XttlOEYKfcUzCMRoBjW7xp3LXyKuuXwGyxiucvNOINeb
	vXL4wtG/ZrI59i1XafcUBKF5lG7/My6kXHfkzqvMgDq2kZrqr5gDvw5a4Si8qP0tID8p
	iKngL6qsby2I3IFZpaTLSoLwgtf5pppI2CFS8=
Received: by 10.141.109.10 with SMTP id l10mr618034rvm.30.1274401518806;
	Thu, 20 May 2010 17:25:18 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c9sm380319rvi.14.2010.05.20.17.25.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 May 2010 17:25:17 -0700 (PDT)
Date: Thu, 20 May 2010 17:25:16 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100521002516.GC29183@gmail.com>
References: <20100521002808.946c76aa.ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <20100521002808.946c76aa.ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross-sdk_cvs.bb fails in do_install
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
X-List-Received-Date: Fri, 21 May 2010 00:29:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/05/10 00:28), Antonio Ospite wrote:
> Hi,
> 
> as per subject binutils-cross-sdk_cvs.bb fails to build for
> DISTRO=minimal this prevents meta-toolchain to be build from scratch as
> well.
> 
> http://tinderbox.openembedded.org/builds/71564/
> 
> Any hints?

Does it happen with 2.20 as well ?

Thx
-Khem



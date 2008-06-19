Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1K9NzK-0006jG-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jun 2008 19:31:58 +0200
Received: by py-out-1112.google.com with SMTP id y77so335033pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2008 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=AbntPrsjNpX1RBUr+3ZvkGq5YzClPI4u7ndTjrjfqmE=;
	b=QLxnSQEPIPtGKfRNEbybYfOHU4IGU2Z+ggeDiDBQSK0ON/mSS4HbEfiWkQa0g/2qqa
	0Ne5HqQ5AwGSiTGb65xP02Z7YKmHYUthlvlwtRhGeuorKznypPKzU9DOHFpdyUkh7h1t
	JMHaxVJjJclsfvKosko6qx5qKVrTlzyPecqKw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=tIPC63aka1e5p101v/K3N3kZ5xAB4CaKPw2mWTa2oILZpc4dpvO6Ynnhfw8Vso29gS
	i2w6Pq0iDeadH0dUuezGENCvr4OKeHi8Fwh0Vhn7W0vUNaOtEVSwvFQVeCzgaF++EkxP
	LeZlwj2+lfJ2QHEPSbuAiC/RDeZ29uvL3b9wQ=
Received: by 10.114.124.1 with SMTP id w1mr2995454wac.73.1213896644251;
	Thu, 19 Jun 2008 10:30:44 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Thu, 19 Jun 2008 10:30:43 -0700 (PDT)
Message-ID: <f96d234e0806191030h5fe401dclbf9de65c98522fe7@mail.gmail.com>
Date: Thu, 19 Jun 2008 13:30:43 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <485A9008.3030502@palm.com>
MIME-Version: 1.0
References: <48598ECE.9030604@palm.com> <1213862302.5018.2.camel@dax.rpnet.com>
	<485A9008.3030502@palm.com>
Subject: Re: bitbake vs incremental builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 19 Jun 2008 17:31:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 19, 2008 at 12:57 PM, K. Richard Pixley
<rich.pixley@palm.com> wrote:

> I'm not seeing any references to BB_STAMP_POLICY in bitbake-1.8.10.  Am I
> looking in the wrong place?

Its in the unreleased HEAD of the bitbake-1.8 branch.  You'll need to
get it from SVN.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com



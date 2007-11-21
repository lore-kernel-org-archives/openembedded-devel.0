Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IvI0i-0006MP-1I
	for openembedded-devel@openembedded.org; Thu, 22 Nov 2007 20:46:52 +0100
Received: from [192.168.2.90] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAMJiOCs012025
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Nov 2007 20:44:29 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@openembedded.org
In-Reply-To: <4743FB40.1030307@gmail.com>
References: <4743FB40.1030307@gmail.com>
Organization: Dore Development ApS
Date: Wed, 21 Nov 2007 14:33:59 +0100
Message-Id: <1195652039.25279.1.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Subject: Re: gfortran needed on host to compile gcc >= 4.1.2
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
X-List-Received-Date: Thu, 22 Nov 2007 19:46:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have succesfully built gcc-4.2.2 with fortran support without gfortran
on host, but then it requires libgmp and libmpfr on host instead. It
should be possible to work around, but for now I have postponed it.

/Esben


On Wed, 2007-11-21 at 03:32 -0600, Junqian Gordon Xu wrote:
> I took the liberty to enable gfortran for gcc_4.1.2 (hence gcc >= 4.1.2 
> has fortran enabled). The side effect is that you need to install 
> gfortran or g77 on your host to compile it.
> 
> Regards
> Gordon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
-- 
Esben Haabendal
Embedded Software Consultant, Dore Development ApS
Phone: +45 5192 5393  Email: eha@doredevelopment.dk




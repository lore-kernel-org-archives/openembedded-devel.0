Received: from [213.4.149.66] (helo=ctsmtpout2.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GXIy3-0001yp-3S
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 16:52:27 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout2.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4526113E00082263 for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 16:46:16 +0200
Message-ID: <452BBFEE.4000408@adtelecom.es>
Date: Tue, 10 Oct 2006 16:44:46 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <452BBCC8.5090505@adtelecom.es>
	<452BAFF4.5050705@dominion.kabel.utwente.nl>
In-Reply-To: <452BAFF4.5050705@dominion.kabel.utwente.nl>
Subject: Re: Problem of configuration of X locale with Kdrive
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 14:52:27 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Yes, when I used the xterminal image that I've generated, the pachages

encodings_X11R7.0-1.0.0-r0_arm.ipk mkfontdir_X11R7.1-1.0.2-r0_arm.ipk
font-util_X11R7.1-1.0.1-r1_arm.ipk mkfontscale_X11R7.0-1.0.1-r0_arm.ipk

were not installed. I installed them manually to get the X11 fonts 
installed.

Thanks and Best Regards,
Joaquim Duran


En/na Koen Kooi ha escrit:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Joaquim Duran schreef:
> 
>> I've observed that if library hasn't any application depending on it, 
>> the bitbake doesn't include the library to the image. Is this a bug?
> 
> Is there any reason why you expect it to be included?
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (Darwin)
> 
> iD8DBQFFK6/0MkyGM64RGpERAuKvAJ9oze7jhbyUgDQOIcru83Ll2iGm3QCgkBLu
> bh7L3drStYsRi7myeiuQ+kU=
> =+AxJ
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




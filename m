Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAfOK-0000WB-5S for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:37:12 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAfFg-0008SY-TE for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:28:16 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:28:16 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:28:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 11:27:59 +0100
Message-ID: <jkeurg$cb8$1@dough.gmane.org>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
	<FD67157F-A373-42D4-93CE-3FF8A142CA56@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <FD67157F-A373-42D4-93CE-3FF8A142CA56@dominion.thruhere.net>
X-Enigmail-Version: 1.3.5
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:37:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 11:15, Koen Kooi schreef:
> 
> Op 22 mrt. 2012, om 11:07 heeft Martin Jansa het volgende geschreven:
> 
>> On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> 
>> Why not move them?
> 
> This was done to have people test it in the oe-core + meta-toolchain
> setup. And to avoid bblayers.conf conflicts
> 
>> Or create stub of meta-toolchain in 1st patch for people to add it to 
>> bblayers and then move it in 2nd.
> 
> That sounds like a better way to do it. Maybe Eric will do that in his
> patchset :)

I don't have a strong opinion on this and if Eric wants me to respin the RFC
I'll gladly do that. But I would prefer that I can be lazy and just merge
other peoples patches :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPav6tAAoJEHZqAkdh1vT6zcYP/2CHId7lbxYDDC2sMa8fb7Nt
+FIRDOIDyF+laMlAwuMMuN0NN6228mxnxmCD0tkrcq6wJnaBJ5+LKkHmwYAUnjrY
q4ayrZTWGGTIkcYVpeizZCh15AomFLuBzTKP/XdOUESQscheV/zdWgT26hqVRQrS
3spk1oS2kzevvmmSqjxBxUUmFMGi85ZcjcsN0aIUpf11+dkU1SpIrGIr7BnybGr/
FEXzWFCHRtSsmI9J6n6dhrDrm3d2fMxV+9AbqeE1SQbaGV+lA+vag5aDhYdfpbOF
S+aPYCCm0rrDsFvNqYTq/IU5Fx2/WUa6zHZlnWoUd1iyvPOaiRezGS7diQfV0R3v
OxCy/75j2cq2ofPebJWG5zGhDvDk9TWW6BqC791WAm9VJjD4ztFhvtE12nXYqIoC
9TDAoURNPNX4FBnLQkX0p6Luo4P5c9hgo6BBwQZR2fwmov4R1nq91AFsMrKJRyxh
VCAqSbzaTJq1zJhh5UZNwRB0SyvDgLbi58NFVOGItX/DUUCUbjC+/aXyIV4Czf75
OeQ29f8vPvzed9wryg8rdogccbuJ2QY9MGaBfEkUOwBNt/HzhYFY4WpcGvvpqsqA
VzPe0wst0+ncGdB2/MewNETXPGy3Mp8xvUTvlabaXnOzRmZqUxkqONVnSZkQqGOy
BCepRNuESem5ktLHCKQS
=5mMh
-----END PGP SIGNATURE-----




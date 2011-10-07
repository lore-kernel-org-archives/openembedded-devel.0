Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RCBV8-0002oY-Fb for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 16:34:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RCBPf-0006qw-QN for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 16:28:35 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 16:28:35 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 16:28:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 07 Oct 2011 16:28:20 +0200
Message-ID: <j6n2a4$gk6$1@dough.gmane.org>
References: <cover.1316616945.git.Imran_Mehmood@mentor.com>
	<j5em9g$3pd$1@dough.gmane.org> <4E89AF1F.3040107@mentor.com>
	<4E8F096F.5040003@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <4E8F096F.5040003@mentor.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH v3 0/2] pull request for twm and xclock recipes
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
X-List-Received-Date: Fri, 07 Oct 2011 14:34:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-10-11 16:15, Imran Mehmood schreef:
> hi koen, I will be thankful if you can kindly comment.

Please submit a new pull request, based on meta-oe with all the pending
mentor patches

> 
> On 10/03/2011 05:48 PM, Imran Mehmood wrote:
>> hi koen,
>> 
>> On 09/22/2011 11:57 AM, Koen Kooi wrote:
> Op 22-09-11 08:31, Mehmood, Imran schreef:
>>>>> From: Imran Mehmood<Imran_Mehmood@mentor.com>
>>>>> 
>>>>> The following changes since commit 
>>>>> 94a25d92b4d0e9379caaab127ccac1a94e9e4d28: Imran Mehmood (1):
>>>>> cramfs: Adds cvs version recipe (initial recipe)
> That isn't in meta-oe, so I can't pull your git tree. I'll grab the
> patches from patchwork for now, but in the future please use a clean tree
> for pull requests
> 
> 
>>> Sorry for much delayed response I was busy with some other issues. I
>>> fixed the warning messages with xclock but before sending the patch
>>> again just wanted to clear a confusion regarding your response
>>> below.
>>> 
>>> I passed 94a25d92b4d0e9379caaab127ccac1a94e9e4d28 to
>>> create-pull-request script with -r because I wanted to create pull
>>> request for all commits on my branch, made after this one. If its
>>> wrong whats the right way or thing to do? I mean
>>> 
>>> what commit id should I pass to the script? Please explain a bit more
>>> in detail so that I can prepare next patch as per requirements.
>>> 
>>> 
>>> 
>>> _______________________________________________ Openembedded-devel
>>> mailing list Openembedded-devel@lists.openembedded.org 
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>> 
Thanks and Regards,
>> Imran Mehmood
>> 
> Thanks and Regards, Imran Mehmood

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOjwyEMkyGM64RGpERAo3SAJ0aha3/uqMgThPCNXGrQg0LKhrjMgCeOyKu
ygNNpWq6Uc2WOn/yf03POok=
=+t4w
-----END PGP SIGNATURE-----




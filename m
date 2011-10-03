Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1RAi2T-0002uv-4x
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 14:54:33 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1RAhx5-00053H-M5 from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 05:48:59 -0700
Received: from [137.202.157.139] ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 3 Oct 2011 14:48:58 +0200
Message-ID: <4E89AF1F.3040107@mentor.com>
Date: Mon, 03 Oct 2011 17:48:31 +0500
From: Imran Mehmood <imran_mehmood@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1316616945.git.Imran_Mehmood@mentor.com>
	<j5em9g$3pd$1@dough.gmane.org>
In-Reply-To: <j5em9g$3pd$1@dough.gmane.org>
X-OriginalArrivalTime: 03 Oct 2011 12:48:58.0854 (UTC)
	FILETIME=[D1B46860:01CC81CA]
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
X-List-Received-Date: Mon, 03 Oct 2011 12:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi koen,

On 09/22/2011 11:57 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-09-11 08:31, Mehmood, Imran schreef:
>> From: Imran Mehmood<Imran_Mehmood@mentor.com>
>>
>> The following changes since commit
>> 94a25d92b4d0e9379caaab127ccac1a94e9e4d28: Imran Mehmood (1): cramfs: Adds
>> cvs version recipe (initial recipe)
> That isn't in meta-oe, so I can't pull your git tree. I'll grab the patches
> from patchwork for now, but in the future please use a clean tree for pull
> requests
>
>
Sorry for much delayed response I was busy with some other issues. I fixed the warning messages with xclock but before sending the patch again just wanted to clear a confusion regarding your response below.

I passed 94a25d92b4d0e9379caaab127ccac1a94e9e4d28 to create-pull-request script with -r because I wanted to create pull request for all commits on my branch, made after this one. If its wrong whats the right way or thing to do? I mean

  what commit id should I pass to the script? Please explain a bit more in detail so that I can prepare next patch as per requirements.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOetxvMkyGM64RGpERAr4DAJ9WbrqTfvlucjBccQm3UYebbaRS0wCeK9Tp
> heTJQrpQAIhKyhzR2IF6yww=
> =c2iD
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
Thanks and Regards,
Imran Mehmood




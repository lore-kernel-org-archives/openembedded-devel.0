Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q0wgC-000439-9n
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 14:58:56 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q0weS-00037p-Tf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 06:57:08 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 19 Mar 2011 06:57:08 -0700
Received: from [172.30.80.15] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sat, 19 Mar 2011 06:57:08 -0700
Message-ID: <4D84B61F.7020303@mentor.com>
Date: Sat, 19 Mar 2011 06:56:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AANLkTimm0B4bFuDgSJ1k+CUG_65Qm2QDeSxEkxWO79fA@mail.gmail.com>
	<im2a3s$ssm$1@dough.gmane.org>
In-Reply-To: <im2a3s$ssm$1@dough.gmane.org>
X-OriginalArrivalTime: 19 Mar 2011 13:57:08.0770 (UTC)
	FILETIME=[89B19020:01CBE63D]
Subject: Re: [2011.03-maintenance] Re: cmake in stable
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
X-List-Received-Date: Sat, 19 Mar 2011 13:58:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2011 06:12 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-03-11 10:58, Maksym Parkachov wrote:
>> Hi everyone,
>>
>> could someone, please, cherry-pick following commits to the
>> 2011.03-maintenance branch as the cmake is broken in this branch.
>>
>> 7ce3543709765f37e359b2fa449216c834a5910e
>> 37a042ec115f100a0aef606ee7f88cad560f0d1e
>
> I added those to my staging tree and will do some test builds.
>
> Tom, if those test builds are successfull, do you want to pick those 2
> up yourself or do you want me to include them in the next pull request?

Next pull request please, thanks!

-- 
Tom Rini
Mentor Graphics Corporation



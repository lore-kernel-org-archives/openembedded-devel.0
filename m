Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q4J6T-0007wB-2S
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 22:31:57 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q4J4b-00045N-JF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 13:30:01 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 28 Mar 2011 13:30:01 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Mar 2011 13:30:00 -0700
Message-ID: <4D90EFC2.4060003@mentor.com>
Date: Mon, 28 Mar 2011 13:29:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D7E3B34.5050100@mentor.com> <4D90E2FA.7020603@mentor.com>
	<20110328201541.GA32128@denix.org>
In-Reply-To: <20110328201541.GA32128@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Mar 2011 20:30:01.0409 (UTC)
	FILETIME=[E9CC9310:01CBED86]
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Mon, 28 Mar 2011 20:31:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/28/2011 01:15 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 28, 2011 at 12:35:22PM -0700, Tom Rini wrote:
>> On 03/14/2011 08:58 AM, Tom Rini wrote:
>>> Hi all,
>>>
>>> The TSC has discussed this item at the request of the community and has
>>> come up with the following recommendation which we are looking for
>>> feedback (positive/negative/neutral) before putting this up on the wiki.
>>
>> Based on feedback I have placed this into
>> http://wiki.openembedded.org/index.php/Version_Retention_Policy
>>
>> Tom Rini
>> Mentor Graphics Corporation
> 
> Tom,
> 
> A slight offtopic: you started signing your emails, but where is the 
> corresponding public key DCDE7271 - I cannot find it on any of the 
> keyservers, although there are plenty of your old keys...

Blah, I didn't realize gpg2 --send-keys didn't work anymore.  It should
be on keyserver2.pgp.com in however long it takes for it to populate (I
can't find it in search just now but I also just clicked the
verification link).

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNkO/CAAoJEI4NMjfc3nJxmxkIALqNj55DpR9kxH+YTxE+CVVY
fHC+tBkCF8mR+NYQ3Qh6duwxBJXJdzWwDZivLow9iu9ej9i5vH5if7n+zsNfbw2+
c7nzZJh3fDk/oT3IRbXiM3CA4rpn/E4uSPGPa4uo0aOtT2NKwRYqrAKqlbWpaHku
DU2e1fN3H9+CMMXDbn4wjOuhCT+HIhaggzaD44zCm/15dK6M6u9ql6thAVq03Efw
x/Ft3nm3jBFhJPF7AEVzmYmI8LICtqUTSfjq6d7uBdnZQoqvnWfJQ9zKsmkBdJ6l
N/NFXX9SEajVc2c/Ez1mn6K32Uy2N36dR8ocmfPs+FVkf7UV0xQvmyhkmkAlNPA=
=dcsn
-----END PGP SIGNATURE-----



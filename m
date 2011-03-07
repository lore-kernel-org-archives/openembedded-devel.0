Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PwX7J-0008Do-EH
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 10:52:41 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 61B37CA9D85
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2011 10:51:05 +0100 (CET)
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 14AD14B0446;
	Mon,  7 Mar 2011 10:50:56 +0100 (CET)
Message-ID: <4D74AA7F.6060506@eukrea.com>
Date: Mon, 07 Mar 2011 10:50:55 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1299360603-24687-1-git-send-email-eric@eukrea.com>
	<AANLkTikWU836s9FM0e0XKdZPuYb=cZs9c0Z3t9nvbZZh@mail.gmail.com>
In-Reply-To: <AANLkTikWU836s9FM0e0XKdZPuYb=cZs9c0Z3t9nvbZZh@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] dropbear: add 0.53.1
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
X-List-Received-Date: Mon, 07 Mar 2011 09:52:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On 06/03/2011 00:08, Khem Raj wrote:
> On Sat, Mar 5, 2011 at 1:30 PM, Eric B=C3=A9nard<eric@eukrea.com>  wrot=
e:
>> * 0.53.1 brings some improvements over 0.52 which was released
>> more than 2 years ago. For more details, check the changelog here :
>> http://matt.ucc.asn.au/dropbear/CHANGES
>> * Please note that DROPBEAR_SMALL_CODEis now disabled which may
>> increase the size of the binaries.
>
> can you compare the sizes of .52 and .53.1 so we know how much it will =
be
>>
for an armv5 target :
0.53.1 : 228112
0.53.1 + DROPBEAR_SMALL_CODE : 178960
0.52 : 183008

Eric



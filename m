Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWUO3-00017x-Up
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 15:46:52 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CC4BC4B0248
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2011 15:40:05 +0100 (CET)
Message-ID: <4ED8E344.6040408@eukrea.com>
Date: Fri, 02 Dec 2011 15:40:04 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
	<CAP9ODKq9VHPHHV57RakS8NB-xCWt3wxHhX3sr0AHdC=rahjM8A@mail.gmail.com>
In-Reply-To: <CAP9ODKq9VHPHHV57RakS8NB-xCWt3wxHhX3sr0AHdC=rahjM8A@mail.gmail.com>
Subject: Re: [meta-oe 1/3] pcsc-lite: handle initscript
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
X-List-Received-Date: Fri, 02 Dec 2011 14:46:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le 02/12/2011 12:28, Otavio Salvador a =E9crit :
> 2011/12/2 Eric B=E9nard<eric@eukrea.com>
>
>> else we get the following log at boot :
>> Configuring pcsc-lite.
>> update-rc.d: /etc/init.d/pcscd: file does not exist
>>
>
> It doesn't need the init script anymore as it has autoload support now.
>
what do you mean by autoload support ?

Eric



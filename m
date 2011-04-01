Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q5lHy-0001Rt-W3
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 22:49:51 +0200
Received: by iye7 with SMTP id 7so4256307iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 13:47:48 -0700 (PDT)
Received: by 10.42.246.131 with SMTP id ly3mr5970407icb.418.1301690868315;
	Fri, 01 Apr 2011 13:47:48 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.231.34.130 with HTTP; Fri, 1 Apr 2011 13:47:28 -0700 (PDT)
X-Originating-IP: [95.29.13.198]
In-Reply-To: <1301683687.3720.1.camel@lenovo.internal.reciva.com>
References: <1301642773.3951.2.camel@mattotaupa>
	<4D95CF3D.9090801@balister.org>
	<1301683687.3720.1.camel@lenovo.internal.reciva.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sat, 2 Apr 2011 00:47:28 +0400
X-Google-Sender-Auth: BtlFp0rxUYiRtyPHi7z8pagDdko
Message-ID: <BANLkTi=4ePfHUdCmUE8BNV3dfYP7Te5gZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: patch queue: latest patches not listed in Patchwork
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
X-List-Received-Date: Fri, 01 Apr 2011 20:49:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/1 Phil Blundell <philb@gnu.org>:
> On Fri, 2011-04-01 at 09:12 -0400, Philip Balister wrote:
>> On 04/01/2011 03:26 AM, Paul Menzel wrote:
>> > Dear OE folks,
>> >
>> >
>> > I do not see the latest patches in our patch queue [1]. Is that a know=
n
>> > problem?
>>
>> The process that processes the patchwork emails started taking 100% cpu
>> yesterday. The admin team had to turn it off so other functions on the
>> machine would run.
>>
>> We need someone who understands enough about patchwork and/or the script
>> to figure out why it is stuck and how to fix it.
>
> I have a bit of spare time this evening. =A0If you can point me to which
> machine patchwork runs on (melo?), which script was causing the problem
> and where it has been disabled, I will take a look at it.

I've done quick search for alternatives. Just posting it here to be
searchable later.

1. http://www.reviewboard.org/
Used by KDE (http://reviewboard.kde.org/)

2. http://code.google.com/intl/en/appengine/articles/rietveld.html
Used as a service by GCC and lot of other projects
(http://codereview.appspot.com/). Source code is available here:
http://code.google.com/p/rietveld/source/checkout

BTW, seems Linaro is using patchwork too:
https://wiki.linaro.org/Platform/Infrastructure/Specs/PatchTracking

--=20
Yury Bushmelev



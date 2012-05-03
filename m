Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SPvJq-0001Lx-IY
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 14:39:38 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0;
	Thu, 3 May 2012 14:29:52 +0200
X-TM-IMSS-Message-ID: <159ef79b001ca8a5@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 159ef79b001ca8a5 ;
	Thu, 3 May 2012 14:29:53 +0200
Message-ID: <4FA27A3F.60500@nedap.com>
Date: Thu, 3 May 2012 14:29:51 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120412 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FA26C26.7080105@nedap.com>
	<CACW_hTb3huecpjkFWmm1zXAij-_hx+NBXfrA0ou6DvafGTWtEw@mail.gmail.com>
In-Reply-To: <CACW_hTb3huecpjkFWmm1zXAij-_hx+NBXfrA0ou6DvafGTWtEw@mail.gmail.com>
Subject: Re: upgrading from oe-classic to oe-core
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
X-List-Received-Date: Thu, 03 May 2012 12:39:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/03/2012 01:40 PM, Frans Meulenbroeks wrote:
> Op 3 mei 2012 13:29 heeft Jaap de Jong<jaap.dejong@nedap.com>  het
> volgende geschreven:
>> Hi All,
>> If I have devices running on oe-classic and I want to upgrade them to
>> oe-core, will the upgrade be without worries?
>> It will probably download all packages?
>> Or do I have to takes special steps?
> Depends on the devices and how well they are supported in yocto (e.g.
> is there a bsp for them)
> And on the actual packages you want to have on your device.
>
> If you have some recipes of your own, you definitely will have some
> work upgrading these.
>
That part is clear! And I'm working on that right now.

What I ment is: I have these devices with all those packages on them 
build with oe-classic.
I would really like to have an idea what will happen when I do a 'opkg 
update ; opkg upgrade' on them.
Anyone done that?
Thanks!
Jaap




Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LmWgY-0008C5-T1
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 18:14:39 +0100
Received: by ewy20 with SMTP id 20so165048ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 10:13:01 -0700 (PDT)
Received: by 10.216.47.201 with SMTP id t51mr3421820web.198.1238001181087;
	Wed, 25 Mar 2009 10:13:01 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 2sm9544898ewy.14.2009.03.25.10.12.59
	(version=SSLv3 cipher=RC4-MD5); Wed, 25 Mar 2009 10:13:00 -0700 (PDT)
Message-ID: <49CA661A.3060304@xora.org.uk>
Date: Wed, 25 Mar 2009 17:12:58 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090325164923.GA4557@excalibur.local>
In-Reply-To: <20090325164923.GA4557@excalibur.local>
X-Enigmail-Version: 0.95.0
Subject: Re: [PATCH] wpa-supplicant: Prepare >=0.6 for dbus system activation
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
X-List-Received-Date: Wed, 25 Mar 2009 17:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> Hello.
>
> To get wpa-supplicant get started via dbus system activation I need the
> following patch.
>
> The renaming of the service file is something must do as it does not get picked
> up correctly without it.
> http://lists.shmoo.com/pipermail/hostap/2007-December/016960.html
>
> For the path issue we have two options a) patch the service file like I did here
> or b) install wpa-supplicant into /sbin as debian does it for example.
>
>   
This is already fixed in OE. Koen and I applied fixes months ago.

Graeme




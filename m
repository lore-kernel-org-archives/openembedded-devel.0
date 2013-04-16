Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1USCBN-0007ky-GZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 22:09:00 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so715446vcb.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=R4Edt5gWlzrv67H6fZxkj1O+k+rqCuzItNXuQVfGDSE=;
	b=iXEzmaIPl+uMbbtpEuIw/i78txrpIFcTpCgFnfbmMtPTuzcgeALkgP0io6hn+nTNdy
	gqvloACEqf4Z8/v29tpVZPXe0SM1bQgMYCNZhLVtKQBhZZ0y0MUMlbbKu/gqrZbhVDWM
	cFRr9T0twbPnoWsSQEPDpBhcxMfRK+i+Ps4oSDRRkZEv8C2GPydsZYyLAtc1SK1jv1Et
	MU01s6K5dy6VTuKbdgA6nzs705wJLzLfK9F9PBPLIp4vPD9dQHb/uhcLetTsIBvCBuf2
	mp0k5nYfIzAMjqkLS15s/1EeVmdWdc5Np1Yh+fYs0UaJTwTZ4eFOeRwi46BDV+H2aE1w
	K92Q==
MIME-Version: 1.0
X-Received: by 10.52.170.143 with SMTP id am15mr2242023vdc.87.1366141878526;
	Tue, 16 Apr 2013 12:51:18 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 16 Apr 2013 12:51:18 -0700 (PDT)
In-Reply-To: <20130416185701.GS10628@jama.dyndns-home.com>
References: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
	<20130416185701.GS10628@jama.dyndns-home.com>
Date: Tue, 16 Apr 2013 20:51:18 +0100
X-Google-Sender-Auth: DLj9YXy6LvHgAhXrzpu23RVkLao
Message-ID: <CANyK_8cvCui97u0UjNSqW7XUf24Co3rwa7pCT17t25CuOX8y6w@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] vim: recommend that runtime data is installed along with binaries
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
X-List-Received-Date: Tue, 16 Apr 2013 20:09:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 April 2013 19:57, Martin Jansa <martin.jansa@gmail.com> wrote:
> Both vim patches in queue for testing, but please update your checkout.
> For following patches (vim strip was using old indentation).

Apologies, a lot can change in a day. Would you like an updated patch
with the correct indentation?

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk



Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RUR50-0006CL-NN
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 23:50:42 +0100
Received: by bkbzs2 with SMTP id zs2so5801373bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 14:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=O7WYYTZiHNahJ+Eam9MkFTLYO9CgC/cydae5Pz/LKOY=;
	b=S/Li/LBkqAY+AugVtFFSmjz9T99ZJ3iPt2ZXsnT3dPD5Z5poCfKVbWaE0tumuuWW6M
	K/y3898/7I47jejlHY8/VR5xjpC+QIqPcHrdOXkq1PX2LmCmxTKBDEqP7TQopWwxxAfH
	oUi4sgKxDDEWV3ICG8u47La6g07Mwa46HiUeU=
MIME-Version: 1.0
Received: by 10.204.13.70 with SMTP id b6mr40311617bka.78.1322347444943; Sat,
	26 Nov 2011 14:44:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Sat, 26 Nov 2011 14:44:04 -0800 (PST)
In-Reply-To: <CAFU7RzP-78tD6dYt+qj2=9EODOCyXAYLVyvn31yLtx+CG8TcoA@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
	<4ED0C603.9020900@telia.com>
	<CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
	<CACW_hTZ6tkRGj938SAg4xmENwe-qRZMGpE=8-KvexQydgD-m_w@mail.gmail.com>
	<CA+M6bXnGhgrzZSuOe99ViWU=eZ5+Q+exWqWkstFJM-MCYzc6zQ@mail.gmail.com>
	<1322344896.16303.49.camel@mattotaupa>
	<CAFU7RzP-78tD6dYt+qj2=9EODOCyXAYLVyvn31yLtx+CG8TcoA@mail.gmail.com>
Date: Sat, 26 Nov 2011 20:44:04 -0200
X-Google-Sender-Auth: 5eaWjmdR0zhXmEHG1cWcyNtMFAs
Message-ID: <CAP9ODKpfGKy-EuY=s=yFsgvfHb=6sc11Fit4jBqE8Ps7fiYn8g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 22:50:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 26, 2011 at 20:37, Raffaele Recalcati <lamiaposta71@gmail.com>wrote:

> ...

Choosing now the baseline for dm3730 with my colleagues it seems that it
> will be arago, that is still oe-classic, because Ti is releasing dvsdk
> based on it. If Ti moves with arago to oe-core we move as well to it.
> Very clean and simple decision, isn't it?


Yes and you deal with the fork of it by your own. Simple consequence, isn't
it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


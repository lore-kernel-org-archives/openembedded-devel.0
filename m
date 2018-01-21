Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F20F78743;
	Sun, 21 Jan 2018 00:01:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0L01WwW014052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 21 Jan 2018 00:01:33 GMT
Message-ID: <1516492892.24502.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Jan 2018 00:01:32 +0000
In-Reply-To: <CA+chaQcFLf+SuwaPq+Jg=8B11w_StoWE2iHzXjXDUynT8MyqQg@mail.gmail.com>
References: <151648740023.29293.16416809305382382616@git.openembedded.org>
	<CA+chaQcFLf+SuwaPq+Jg=8B11w_StoWE2iHzXjXDUynT8MyqQg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch morty updated: image: Expand PV to avoid AUTOREV parsing failures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jan 2018 00:01:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-01-21 at 00:51 +0100, Martin Jansa wrote:
> This causes:
> 
> Exception: TypeError: getVar() missing 1 required positional
> argument: 'expand'

Sorry, fix pushed.

Cheers,

Richard


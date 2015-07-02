Return-Path: <picmaster@mail.bg>
Received: from mx2.mail.bg (mx2.mail.bg [193.201.172.118])
	by mail.openembedded.org (Postfix) with ESMTP id C902175BFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 10:21:50 +0000 (UTC)
Received: from [192.168.0.62] (unknown [93.152.143.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx2.mail.bg (Postfix) with ESMTPSA id 4E19A6003807;
	Thu,  2 Jul 2015 13:21:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1435832507; bh=Si/Ld5FgMqdup0BMJW972zm0PQecAtIcdSCgbE+kGRg=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=QQg6zZtWLkrgoqdT1j496OqgIA0WduGiTX1wIK5KDmwNoc/o4J2pRtvD0IC0MTVRn
	wvWLBcGXCZvZQ6cjZC00gEumd2Fx0dVcj5myGU1CeGJRBdVL2KWeB5yp5uzBs5O4pZ
	/W7yuwfg/6hDFnKBz6Gm4DULWr+sjA70c6zgP/JY=
Message-ID: <559510BB.507@mail.bg>
Date: Thu, 02 Jul 2015 13:21:47 +0300
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: zoltan.kuscsik@linaro.org
References: <5579F20D.5040900@mail.bg> <557A817E.7070709@mail.bg>
	<CAAzKXnhLePQYW43RdumMTtB4zO6FSRMzptFGGi4V8_F1gCmywQ@mail.gmail.com>
In-Reply-To: <CAAzKXnhLePQYW43RdumMTtB4zO6FSRMzptFGGi4V8_F1gCmywQ@mail.gmail.com>
Cc: meta-freescale@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2015 10:21:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zoltan,

On 06/12/2015 09:57 AM, Zoltan Kuscsik wrote:
> Do you have a crash log? If not, you should change your build from Release
> to Debug and
> get some backtraces.

The chromium debug binary is 3.1GiB, there's no way to run this on my
ARM target. If you have other suggestions how to extract trace/debug
info, I would be glad to try them.

Regards,
Nikolay


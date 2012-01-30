Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rrxvy-0002Nm-6l
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 21:34:38 +0100
Received: by lahc1 with SMTP id c1so2386807lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 12:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2ZVMz+GOVxgrwUPD5yLbUhQIEDY2/DkBdoNfcTS0ac8=;
	b=vuDeZp5GdbWhEYcPkxOFmDAZ2AgXEnxZUnycYp6yhLQOeYu1OmqB9AyRlyL6vCyhqX
	D0dvIvVpTRj/7TnB/CS+G83AVd2mNpAGqNeaJWDYwCuB50PrjInu73gZ7P8396eKXCCW
	0csFUfFivqEeEe8eFkbnN4sNN5hu6cDwhTpNI=
Received: by 10.152.122.38 with SMTP id lp6mr9732321lab.13.1327955205246; Mon,
	30 Jan 2012 12:26:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 12:26:15 -0800 (PST)
In-Reply-To: <1327952832-24292-1-git-send-email-tworaz666@gmail.com>
References: <1327952832-24292-1-git-send-email-tworaz666@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 12:26:15 -0800
Message-ID: <CAMKF1srLBtbG2gHiGowRZ1y0BEbTk_yBwc0kfWqM_jQkA0C2fg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] obexd: update to 0.44
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
X-List-Received-Date: Mon, 30 Jan 2012 20:34:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 11:47 AM, Peter Tworek <tworaz666@gmail.com> wrote:
> +DESCRIPTION = "OBEX Server and Client"

As an aside I guess it would be worth to separate out client and
server into separate output packages in this recipe



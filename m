Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id D48A865C7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 14:16:18 +0000 (UTC)
Received: by yhzz6 with SMTP id z6so12247356yhz.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sh0KVbNZbMH2SqoEnpsmSTQyxk3Bd74DthGvil0X/j8=;
	b=RrKEE2QDAKJFJYOg/F6E/u7kHS7pd1sqnT0bjMN1xK0/3iEa0bclTfZicdJ6aEu4u1
	BgKPjdgQ3Fv3INLVPIhbAN6V+MGDgrdEQ32Yt/+WAjcB22yaeeo10oH17kM05kZV7dKm
	R1Ua0t25RfOANku/IDWKcdGf84f6L6ae85Zqn0DqEWGa2gubg8u64dN8JHZlyF3tSqd5
	W5CKN2dWPVkpOXFyYEkmEWr27zVf9H0xaYRTCm0l1x0wgHCnua1IWEwel1KOiJhLgBKQ
	ygY/0SZwngeQ8hTJrLszAOFHERen14Nh8ByfZpdZkJXFIwxE8x07JT/D/sKiYKU4vDzw
	lwtA==
MIME-Version: 1.0
X-Received: by 10.170.133.202 with SMTP id z193mr23072838ykb.30.1425219379286; 
	Sun, 01 Mar 2015 06:16:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Sun, 1 Mar 2015 06:16:18 -0800 (PST)
In-Reply-To: <1425165316-3988-1-git-send-email-raphael.philipe@ossystems.com.br>
References: <1425165316-3988-1-git-send-email-raphael.philipe@ossystems.com.br>
Date: Sun, 1 Mar 2015 11:16:18 -0300
X-Google-Sender-Auth: YQ0GAfhZwIVBJzu008po4a-lkrQ
Message-ID: <CAP9ODKpYxL=rAsGM9=6ghxiwbCmnxMyk_kqW8C-xyLEFEWZ8AQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Raphael Silva <raphael.philipe@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v2] fio: fix do_compile error
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
X-List-Received-Date: Sun, 01 Mar 2015 14:16:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 28, 2015 at 8:15 PM, Raphael Silva <rapphil@gmail.com> wrote:
>   * Update to v2.2.6
>
> Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>


Acked-by:  Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


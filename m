Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7C47E6D767
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 09:52:41 +0000 (UTC)
Message-ID: <5285EEE4.4070208@communistcode.co.uk>
Date: Fri, 15 Nov 2013 09:52:36 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>
In-Reply-To: <CAOXsvCQhMLr+U=FOmoeSW_yWoMfnMA7VReKKhNuwfDTf1a868Q@mail.gmail.com>
Subject: Re: How to add PHP
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
X-List-Received-Date: Fri, 15 Nov 2013 09:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15/11/13 05:58, Scott Penner wrote:
> Hi and thanks for this resource,
> 
> I am trying to add PHP to my image and cannot!
> I've tried a few different attempts, sort of documented
> here<https://community.freescale.com/message/359851#359851>
> Its for a imx6sabrelite board and I'm trying to modify the fsl-image-test
> image.
> I can add the apache server, and it works, but get errors during the bake
> when adding PHP.
> Should I be using the PHP packages in the webserver directory or devtools
> directory?
> Do you have any working examples of a lamp install or just apache/PHP
> install procedure?
> 
> Thanks for any insight,
> 
> Scott Penner

Hi Scott,

There should only be one location for PHP, or are you getting PHP and
mod-php mixed up? If so, you should read up on what the differences are
and decide which one you need.

Secondly, we can't help without error logs :)

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


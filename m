Received: from [194.158.229.90] (helo=smtp-auth-be-06.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1InKmI-0004fS-5K
	for openembedded-devel@openembedded.org; Wed, 31 Oct 2007 22:07:06 +0100
Received: from [192.168.26.12] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140]) (authenticated bits=0)
	by smtp-auth-be-06.sunrise.ch (8.13.1/8.13.5) with ESMTP id
	l9VCXKvH015932; Wed, 31 Oct 2007 13:33:20 +0100
Message-ID: <47287669.4050607@vollmann.ch>
Date: Wed, 31 Oct 2007 13:34:49 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.7.8) Gecko/20070113 Debian/1.7.8-1sarge10
X-Accept-Language: en
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <471FC1C0.4010103@linux.it>
	<20071025001926.GA14645@lenovo>	<472047C3.20208@student.utwente.nl>
	<20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
In-Reply-To: <f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
Subject: Re: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2007 21:07:06 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On 10/25/07, David Farning <dfarning@gmail.com> wrote:

>>But I am struggling over what to call the object of a bitebake.  (In
>>make they are call targets .ie make all, but in the embedded world
>>target is used to refer to the device for which you are building.)
>>
>>$bitbake vim
>>$bitbake task-base
>>$bitbake gpe-image
>>$bitbake world
>>A package, a task, an image, and world?
> 
> 
> I suppose it depends -- saying that I'm "building a packages" is
> technically correct as the ipk/deb is the output.  But, "bitbaking a
> recipe" is probably more correct.
"bitbaking a recipe" is correct.
But "vim" or "task-base" above are not recipes.
"vim_7.0.bb" or "task-base.bb" are recipes.

I still think "target" (or "build target") would be the
best term for "vim" or "task-base", though I agree that
this might be confused with the "target device".

   Detlef



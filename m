Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M0c1X-0000hr-Ih
	for openembedded-devel@openembedded.org; Sun, 03 May 2009 15:46:31 +0200
Received: from [209.242.7.139] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M0bw1-0008FL-G1
	for openembedded-devel@openembedded.org; Sun, 03 May 2009 08:40:49 -0500
Message-ID: <49FD9EEA.4030608@dls.net>
Date: Sun, 03 May 2009 08:40:58 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
	<49FD9A75.3000609@balister.org>
In-Reply-To: <49FD9A75.3000609@balister.org>
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Sun, 03 May 2009 13:46:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Leon Woestenberg wrote:
>> #############################################################################
>>
>> #I am a bit annoyed by the hash lines in some of the files
>> #############################################################################
>>
>> # They distract me from the real content of the files.
>> #############################################################################
>>
>> RFC_REMOVE_HASHLINES ?= 1
> 
> Although this might start a coding style war, I also find them distracting.

Hehe!

Let's replace them with prettier formats:

#=#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#
#
#  I prefer this style.  For Major Section headers, anyway.
#
#=#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#

#---------------------------------------------------------------------
#
# And of course, this style is alway popular for Minor Section headers.
#
#---------------------------------------------------------------------



Consider the coding style war begun...  Seriously, I'd prefer we don't
worry too much about the comment styles.

Yes, some of the structures annoy me, and I would organize some of the
conf files differently, and some files have more blank lines than I
would like, and others need some  carefully-place blank lines in my
opinion, and while we're discussing this, I think the style rules that
PR = "r0" should never appear in a recipe is baloney; I feel very
strongly that should appear in all recipes....  this could become quite
the can of worms, I think.  :-)


RFC_REMOVE_HASHLINES--;

Or, rfcRemoveHashlines-- if camelCase is your preferred style... :-)


Mike (mwester)

Oops - or should that be:

~Mike (mwester)

;-D



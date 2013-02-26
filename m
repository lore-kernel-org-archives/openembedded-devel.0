Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1UAJ3k-0004cV-4F
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Feb 2013 12:51:01 +0100
Received: by mail-lb0-f175.google.com with SMTP id n3so3057638lbo.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 03:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/AElL3nQPSjDD4N5YrH69+LtuwSf+bOU07l75OADz9g=;
	b=aL0+/m+6Jhl9UPCWbmbOVE+7lpW3tllJ2NWkTDeL1aFK5XFZEDxiRA6h3DT1mXimb7
	SkJAi/q1BbXbWrvqXYw5pRBcHjsidiz3qENjID+xyXiL5Rs0uU2PN9TKB/ESNpF3zVzH
	0PGorFh3PbA0OmX+ykSvA4CUMOhFZdra3ryaID2Wf6aZsGILjYboSJ0uTXe6nDRD4aV4
	2jO/LCU6V+T4IF6xOtbKpRZL+S6JEZzW8Wqc4+vlSv0JRf0pP8aNtcxa/bEB8XQZhd7N
	RWRJS8pogwW+XXCmuRnqJPvJHR2n+kszwureUQdUYuOHxikazRrBcXruh0OaEP3o6fvW
	Qscw==
X-Received: by 10.112.87.105 with SMTP id w9mr438082lbz.14.1361878480986;
	Tue, 26 Feb 2013 03:34:40 -0800 (PST)
Received: from [192.168.0.96] (147.84-49-231.nextgentel.com. [84.49.231.147])
	by mx.google.com with ESMTPS id t17sm417275lam.9.2013.02.26.03.34.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 03:34:39 -0800 (PST)
Message-ID: <512C9DCC.4050005@gmail.com>
Date: Tue, 26 Feb 2013 12:34:36 +0100
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51262D01.7070601@gmail.com> <20130222222611.GB3300@jama>
In-Reply-To: <20130222222611.GB3300@jama>
Subject: Re: Qt5
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
X-List-Received-Date: Tue, 26 Feb 2013 11:51:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/22/2013 11:26 PM, Martin Jansa wrote:
> On Thu, Feb 21, 2013 at 03:19:45PM +0100, Tasslehoff Kjappfot wrote:
>> Is the meta-qt5 layer at https://github.com/meta-qt5 a work in progress,
>> or should it be usable in its current state?
> 
> Not really, but I plan to work on it next week(s).
> 
>> I currently use qt4-embedded and compile and sdk with qt-support, and
>> want to try out qt5. Compiling qtbase gave me some packages I can add to
>> my image, but when I tried to create an SDK I got stuck. The
>> files/recipes in meta-qt5 differ so much from todays qt4-stuff that I'm
>> not sure where to begin, but I suspect at least an SDK-recipe/task and
>> maybe some qt5-embedded recipes will have to be added?
> 
> upstream sources also differ a lot, so recipes will stay different to
> reflect that.
> 
>> Thought maybe I'd see if I can create these recipes, but I just wanted
>> to check if that is the plan forward.
> 
> If you create something useable send it as pull request on github, I
> plan to fix issues in current recipes, but don't plan to work on sdk
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

Will do, thanks for the info.

- Tasslehoff



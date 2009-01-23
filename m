Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LQOCA-0008EZ-En
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 16:43:46 +0100
Received: by ey-out-1920.google.com with SMTP id 4so647139eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2009 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=a7X3z/9l7ScBi5Sp57t1prCJS1Z5/i0bpyl5mdYM9/I=;
	b=h4M6H75i4/iNSlmno/n8NQHcjOdu+RDOwCBmwTjrEgGJ8+TIsv7LqkPwp4eVHMOTPr
	mWZE2356ikkGg9r/rfNsVLFSh4CxEjbh6PhHlaFjvZLHdGJXnkaBm5Kg+9baifftjDFW
	9zLEHjbT5YZLbzgFP+UnigEyB5sOj1DElONIo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=t00PEIl8RWn5mUgbiKhW4ro1m+fmSWHm4vjT2vyo2II7DYGdl6o+IYfsoLSvwPSrmK
	Q+klVBrqaRssR9ne5guKAUFchuLUyr6QU4HBZ0mpmnmHMHiwZSsEq+AqIUZxx3eMBU47
	T6066WslNiUVN9AOhjL4adirIfphDPCB+BnNM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.210.61.11 with SMTP id j11mr6834671eba.60.1232724991340; Fri, 
	23 Jan 2009 07:36:31 -0800 (PST)
In-Reply-To: <20090123120029.GB19349@ibawizard.net>
References: <200901230131.09511.mickey@vanille-media.de>
	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br> <49799C30.90508@epfl.ch>
	<glc8ce$eoh$1@ger.gmane.org> <20090123120029.GB19349@ibawizard.net>
Date: Fri, 23 Jan 2009 08:36:31 -0700
X-Google-Sender-Auth: c3cb91f37bd85a31
Message-ID: <b6ebd0a50901230736x4d2ae4j6a0adf442cac6f0b@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Mailinglists, was: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 15:43:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Jan 23, 2009 at 5:00 AM, Petr Stetiar <ynezz@true.cz> wrote:
> Koen Kooi <k.kooi@student.utwente.nl> [2009-01-23 12:06:54]:
>
>> On 23-01-09 11:30, Valentin Longchamp wrote:
>> >I would definitely support a patch review style like on the linux kernel
>> >mailing-lists even if this implies a high-traffic list (with simple
>> >filter rules in your mail client, it's easy to handle). However, I don't
>> >think it would be a good idea to have two lists.
>>
>> I'd go even further by saying we should reorganize the mailinglists into
>> this:
>>
>> * oe mailinglist for humans
>> * combined commit + autobuild log list for non-humans
>>
>> That should reduce confusion which list to use (oe-user, oe-devel, etc)
>> for sending mails and more people get to see patches flying by. Even if
>> you don't review them having more code snippets on the list is usefull
>> for newcomers.
>
> That would be awesome.

I don't know if you guys are aware, but the pybugz project has a
commandline tool that interfaces with bugzilla.  It actually works
really well from the little time I've spent with it so far.  It'd be
much, much nicer than the web interface for people's workflows, and
then we wouldn't lose the advantages of a bts.

See http://www.liquidx.net/pybugz/ - the example workflow section, specifically.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.



Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSLgQ-000663-Qi
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2012 07:13:01 +0200
Received: by qady23 with SMTP id y23so72104qad.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 22:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=d9YMMtGC9mffsTunhDyCKBkomh/FQun93k9tGYEe534=;
	b=S5+yMMcJEpeIv5AOJbcJh4JwS9JziVl/kU7HvkCZYJH4+gas8rviUrfRD31+Cndler
	/hbVuWeLI2vkp16DvS8/dUoy/AKlpV39qY5Xl7203OYBnU+Nat0cumuahZ9eeT+Y9DSf
	Ks7t9TV/92yCZUqHcegQxl0WuAfJClrOHGrsgGodGjABJ+8f4VgG7+NeSVfXkYC36Xss
	0G0nlK4N1iroplxyjkCNmrW7F71AHr7eDTCZ6/fEYnp0ty3IdXtt/Us0pvmH5aYYEfoQ
	TV29jDgjUsymqYn4Z+NDUJJM1iVH75xdO5TZYBlqkZCRyXZsE67SJVn3TwLtzOZOB/Kc
	AjdA==
Received: by 10.224.185.204 with SMTP id cp12mr9436194qab.42.1336626184801;
	Wed, 09 May 2012 22:03:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.214.81 with HTTP; Wed, 9 May 2012 22:02:44 -0700 (PDT)
In-Reply-To: <CAMKF1soMDLn4nEPtL8SBvooG0o2PmtnN4EzebO7r8HmLeEFK9w@mail.gmail.com>
References: <CAA5cW2zfvw65-vtwCZWfTsnfAO8e-jA=qsd0zqXvStYfhhy8bQ@mail.gmail.com>
	<CAMKF1soMDLn4nEPtL8SBvooG0o2PmtnN4EzebO7r8HmLeEFK9w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 May 2012 22:02:44 -0700
X-Google-Sender-Auth: cEG73EdHueMCrGh4hy6CJY8iaXw
Message-ID: <CABcZANkRnVmNdceAf5o-Lqw+GH8vjs06GeJpB8fcCg=G5qL6Ww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Provide a master/setup layer - best practice?
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
X-List-Received-Date: Thu, 10 May 2012 05:13:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 9:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 9, 2012 at 1:13 PM, Radoslav Kolev <radoslav@kolev.info> wrot=
e:
>>
>> It seems like there's some "reinventing the wheel" going on. =C2=A0What
>> would be your advice for the best approach and starting point in this
>> situation?

If there was one 'best' option for any given situation, we wouldn't
have this much so-called wheel reinvention. People have different
needs.
--=20
Christopher Larson



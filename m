Received: from [209.85.198.236] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LUdEg-0007cW-7u
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 09:35:58 +0100
Received: by rv-out-0506.google.com with SMTP id g9so1790323rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2009 00:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZcnqgWDeWeCfuwgiD499Dxayc1QoTbfGPlk/V+z57iQ=;
	b=xMPmpI+osBIA0lFM6owTj5oTR9aoCH3J8Q/bxBOvcfcSjAiyGVFwsPDTZI5QVwa14d
	Uf8hTIkY5owZSZfEK6zgp9QGauKT04cPmxm/CC7mbL/BcC6BqfatDD2y+I1LJOSc9C27
	TC1NUUgslFJqyM5OvahqNlLtomdajbs7c25Cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p+9c9q8BiGJ7/nBLthSWfiY6iXY/YDdT02wg3lX7J0r/AJMRJERBzrjWMUdCBucnVA
	1Wc2ZlexlvOBTqpJf2Ncb8YvXLS8MB4juVn+lvnSpwGMcgjt1MsHlfVT3EUg0iytLxN3
	9CDABnN+1q00T4Q2p3BP2hFacdvk1cMganOZ4=
MIME-Version: 1.0
Received: by 10.141.203.7 with SMTP id f7mr2780334rvq.256.1233736548797; Wed, 
	04 Feb 2009 00:35:48 -0800 (PST)
In-Reply-To: <a7f8874a0902032245v333a379dq179c5bd7369f5dde@mail.gmail.com>
References: <a7f8874a0902032245v333a379dq179c5bd7369f5dde@mail.gmail.com>
Date: Wed, 4 Feb 2009 00:35:48 -0800
Message-ID: <a7f8874a0902040035kcf95670u1378572abb0ce9c2@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] sg3-utils: get 1.24 to cross compile
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
X-List-Received-Date: Wed, 04 Feb 2009 08:36:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Never Mind. This still has issues

On Tue, Feb 3, 2009 at 10:45 PM, Hans Henry von Tresckow
<hvontres@gmail.com> wrote:
> Please review this patch and push if OK
>
> Thanks,
> Henry
>
Never Mind. This still has issues

-- 
Henry von Tresckow (hvontres)
Rodney Dangerfield  - "My marriage is on the rocks again, yeah, my
wife just broke up with her boyfriend."



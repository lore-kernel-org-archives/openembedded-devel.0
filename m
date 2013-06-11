Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B8BFE6A9CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:44:40 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id x12so716646ief.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kDRhY1Ly+N3QNlDiWvQGIOK6v/VIRJdAsJnWDQkgyw4=;
	b=tx0mJilyy5hKS7YuNJXeWyw88UW9icTBOUjvRXmv8JOsMBeIgidqM8I5dFNjxsq7bF
	8IwFnY724jakYAy8w0cXSz8NTXrXg+r10F9OqZGKPNvD24cx8n0HbfvJVx/b1ZAJNvk4
	ILEdAEVFfbmtLBU15A7Ab85H1LXjTKpNceKPQLDrLU1fz0XIY3Az0CTrwYbJT9LqgB1l
	Gtwpmbhf8aFp+u10sgm1XzshUcJwS4frqcToP+rzPUsIYzo7gt2UUCrG3CElFiQk0cj2
	/xcLCFT53bZtANYui2DO64upzCbTQvV8Er0CuVPlqNM1rnY9tHVC7RBD4yYsfJ9BsvjC
	8lgg==
X-Received: by 10.50.6.51 with SMTP id x19mr389135igx.78.1370940281926; Tue,
	11 Jun 2013 01:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 01:44:11 -0700 (PDT)
In-Reply-To: <20130611084204.GB3233@jama>
References: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
	<20130602080956.GA3279@jama> <20130606123417.GC22710@jama>
	<CAMKF1sr20XzmonOmtDExLhZdUts3KgpdiU2uyNVxUKBo5npamg@mail.gmail.com>
	<20130611084204.GB3233@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 01:44:11 -0700
Message-ID: <CAMKF1sq5D_xs03SA5j9XxpUEwom+ekhX8_ZDOoC78=t7RUGiEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-efl][PATCH] webkit-efl: Fix build with gcc-4.8
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
X-List-Received-Date: Tue, 11 Jun 2013 08:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 1:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I guess we were all waiting for you to return from holidays and update
> gcc to 4.8.1 :).

infact i do have 4.8.1 recipes cooking :)


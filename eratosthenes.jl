### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 036f241a-4ecd-11eb-2b90-bf5623009c19
function eratosthenes( n )
	prims = [ true for i in 1:n ]
	
	sqrn = convert( Int64, floor(n^(1/2)))
	
	for i in 2:sqrn
		if prims[i] == true
			st = i^2
			while st <= n
				prims[st] = false
				st = st + i
			end
		end
	end
	
	return prims	
end

# ╔═╡ 76cfe29e-4ecf-11eb-2e3b-55372e311cdc
function primesupton( n )
	prims = eratosthenes( n )
	return [ i for i in 2:n if prims[i] == true ]
end

# ╔═╡ cd8bfad4-4ecd-11eb-2f7e-39ef0395da70
length(primesupton( 1000 ))

# ╔═╡ e473d5f2-4ecd-11eb-26cc-f37e1c5e2edd
begin
	k = 100000
	prims = eratosthenes( k )
end

# ╔═╡ 5869aed4-4ecf-11eb-1a4f-97f4e0f7998c
begin
	numprimes = [length( [ j for j in 2:i if prims[j]]) for i in 1:k]
	logs = [ i/log(i) for i in 1:k]
	[ numprimes[i]/logs[i] for i in 1:k]
end

# ╔═╡ 7133479c-4ed2-11eb-0b69-47cac0c403ee
numprimes

# ╔═╡ Cell order:
# ╠═036f241a-4ecd-11eb-2b90-bf5623009c19
# ╠═76cfe29e-4ecf-11eb-2e3b-55372e311cdc
# ╠═cd8bfad4-4ecd-11eb-2f7e-39ef0395da70
# ╠═e473d5f2-4ecd-11eb-26cc-f37e1c5e2edd
# ╠═5869aed4-4ecf-11eb-1a4f-97f4e0f7998c
# ╠═7133479c-4ed2-11eb-0b69-47cac0c403ee
